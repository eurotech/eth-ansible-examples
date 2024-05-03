# Configure Linux Users

This playbook can be executed locally or from remote (enabling the eth-update role) to configure a Linux User in the gateway. It is not intended to fully manage a Linux User, but only to perform the following operations:

- enable sudoers to run all commands without password
- add the defined user to sudoers 

The user name has to be defined in the playbook.
