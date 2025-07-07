from __future__ import absolute_import

from ansible.plugins.callback import CallbackBase

import os
import json
import time
import atexit
import signal
import sys
import logging

from systemd import journal

class CallbackModule(CallbackBase):

    JOB_BASE_DIR = "/var/lib/eth-localexecution-area/localexecutions/"

    LEVEL_TRACE = "TRACE"
    LEVEL_INFO = "INFO"
    LEVEL_ERROR = "ERROR"

    EXECUTION_STARTED_EVENT = "LOCAL_EXECUTION_STEP_STARTED"
    EXECUTION_COMPLETED_EVENT = "LOCAL_EXECUTION_STEP_COMPLETED"
    JOB_COMPLETED_EVENT = "LOCAL_EXECUTION_COMPLETED"
    NOTIFICATION_EVENT = "LOCAL_EXECUTION_STEP_NOTIFICATION"

    REQUIRED_EXECUTIONS_FILE = "required_executions"
    PERFORMED_EXECUTIONS_FILE = "performed_executions"
    JOB_COMPLETE_FILE = "completed"

    def __init__(self, display=None, options=None):
        super(CallbackModule, self).__init__(display, options)

        try:
            self._job_id = os.environ['ETH_JOB_ID']
            self._job_dir = self.JOB_BASE_DIR + self._job_id + '/'
        except:
            raise Exception('ETH_JOB_ID is not set!')

        try:
            os.stat(self._job_dir)
        except:
            os.makedirs(self._job_dir)

        try:
            self._execution_id = os.environ['ETH_EXECUTION_ID']
        except:
            self._execution_id = os.environ['ETH_JOB_ID']
            self._report_execution_started()

        try:
            self._log_file = open(self._job_dir + "log", mode='a')
        except:
            raise Exception('failed to create log file!')

        self._successful = True

        self._print_execution_event(self.EXECUTION_STARTED_EVENT)
        self._register_exit_handlers()

    def _print_execution_event(self, type, data=None):
        if data is None:
            data = {}

        data["type"] = type
        data["execution_id"] = self._execution_id

        self._print_event(data)

    def _print_event(self, obj):
        self._log_file.write(json.dumps(obj) + "\n")
        self._log_file.flush()

    def v2_playbook_on_task_start(self, task, is_conditional):
        self.task = task
        self._print_execution_event(self.NOTIFICATION_EVENT, { "level": self.LEVEL_TRACE, "message": self.task.get_name() + " - started"})
        journal.send(self.task.get_name() + " - started", ETH_JOB_ID=self._job_id, EXECUTION_ID=self._execution_id, SYSLOG_FACILITY=20, PRIORITY=7)

    def v2_runner_on_ok(self, result):
        self._print_execution_event(self.NOTIFICATION_EVENT, { "level": self.LEVEL_TRACE, "message": self.task.get_name() + " - ok ", "details": json.dumps(result._result)})
        journal.send(self.task.get_name() + " - ok ", DETAILS=json.dumps(result._result), ETH_JOB_ID=self._job_id, EXECUTION_ID=self._execution_id, SYSLOG_FACILITY=20, PRIORITY=7)

    def v2_runner_on_skipped(self, result):
        self._print_execution_event(self.NOTIFICATION_EVENT, { "level": self.LEVEL_TRACE, "message": self.task.get_name() + " - skipped ", "details": json.dumps(result._result)})
        journal.send(self.task.get_name() + " - skipped ", DETAILS=json.dumps(result._result), ETH_JOB_ID=self._job_id, EXECUTION_ID=self._execution_id, SYSLOG_FACILITY=20, PRIORITY=7)

    def v2_runner_on_failed(self, result, ignore_errors=False):
        level = self.LEVEL_INFO if ignore_errors else self.LEVEL_ERROR

        message = ""

        try:
            message = message + "\n" + result.exception.split('\n')[0]
        except:
            pass

        try:
            message = message + "\n" + json.dumps(result._result)
        except:
            pass

        self._print_execution_event(self.NOTIFICATION_EVENT, { "level": level, "message": self.task.get_name() + " - failed", "details": message})
        journal.send(self.task.get_name() + " - failed", DETAILS=message, ETH_JOB_ID=self._job_id, EXECUTION_ID=self._execution_id, SYSLOG_FACILITY=20, PRIORITY=6 if level==self.LEVEL_INFO else 3)
        if not ignore_errors:
            self._successful = False

    @staticmethod
    def _put_line(path, line):
        with open(path, mode='a') as file:
            file.write(line + "\n")
            file.flush()

    def _report_execution_started(self):
        self._put_line(self._job_dir + self.REQUIRED_EXECUTIONS_FILE, self._execution_id)

    def _report_execution_completed(self):
        self._put_line(self._job_dir + self.PERFORMED_EXECUTIONS_FILE, self._execution_id)
        self._print_execution_event(self.EXECUTION_COMPLETED_EVENT, { "result": "SUCCESS" if self._successful else "FAILURE" })

    @staticmethod
    def _load_executions_file(path):
        try:
            result = set()
            with open(path, mode='r') as file:
                for line in file:
                    result.add(line)
            return result
        except:
            return set()

    def _check_job_completed(self):
        required = self._load_executions_file(self._job_dir + self.REQUIRED_EXECUTIONS_FILE)
        performed = self._load_executions_file(self._job_dir + self.PERFORMED_EXECUTIONS_FILE)
        if required == performed:
            self._print_event({ "type": self.JOB_COMPLETED_EVENT })

    def _cleanup(self):

        try:
            self._report_execution_completed()
            self._check_job_completed()
        except:
            pass

        try:
            self._log_file.close()
        except:
            pass

    @staticmethod
    def _register_handler(sig):

        def exit(_a, _b):
            pass

        if signal.getsignal(sig) == signal.SIG_DFL:
            signal.signal(sig, exit)

    def _register_exit_handlers(self):
        self._register_handler(signal.SIGTERM)
        self._register_handler(signal.SIGHUP)
        atexit.register(self._cleanup)
