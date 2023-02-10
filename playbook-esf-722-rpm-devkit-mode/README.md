# Upgrade ESF to 7.2.2 with RPM self contained

This playbook shows how to embed an rpm to the playbook package.
The playbook will update via DNF ESF to 7.2.2 for a ReliaGATE 10-12 with EL 27.1.0.
The playbook will obviously need to be customized for different combination of target devices/OS versions.

## How to distribute

Make the needed changes to the playbook to adapt it to the target devices on the field.
Just zip the content of the folder, upload it to the shared space.
Configure a new EC activities entry as specified in the official EC documentation.

Run a remote update on compatible targets.