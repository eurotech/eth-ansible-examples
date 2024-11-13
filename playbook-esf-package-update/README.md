# Playbook to upgrade an ESF package

This playbook shows how to perform an ESF bundle upgrade via Everyware Cloud.

## Pre-requisites

1. Download https://github.com/eurotech/eth-ansible-examples/tree/main/playbook-esf-package-update

2. Compress the content into a ZIP archive and copy it to the target device(s) (be sure to not include the directory in the zip file. The unzipped files should only contain the `site.yml` and the `roles` directory)

3. On ESF, under default Cloud Connection, configure and connect to an Everyware Cloud broker.

4. On ESF create a new dedicated identity with the following credentials (or use an existing one):

- name: `maintenance`
- password: `maintenance12345`

5. On ESF give this new user access to the Rest APIs

6. On ESF enable Basic Authentication for the Rest APIs (RestService -> Basic Authentication Enabled -> true)

For the package installed via this playbook you'll need to ensure ESF is in development mode. The Ansible script will install a package which is not signed. In a production environment, you should sign the package before installing it.

## Instructions

1. Create a new activity in Everyware Cloud (see Device Activities section) where:

- name: "Upgrade Package"
- description: optional*
- device application: ANSIBLE-V1
- resource URL: e.g "file://localhost/home/root/upgrade.zip"
- resource URL Auth: NONE
- labels: optional*

2. Under Everyware Cloud (EC5) > Devices select connected device

3. Under "Activity Update" open "New Update"

- select log level: info
- select your type: Upgrade Package

4. Submit
