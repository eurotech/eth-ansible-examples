# Playbook to install Modbus and define a Modbus data retrieval scenario

This playbook shows how to perform an ESF bundle upgrade via Everyware Cloud.

## Pre-requisites

1. Download https://github.com/eurotech/eth-ansible-examples/tree/main/playbook-esf-modbus-wires-example

2. Compress the content into a ZIP archive and copy it to the target device(s) (be sure to not include the directory in the zip file. The unzipped files should only contain the `site.yml` and the `roles` directory)

3. On ESF, under default Cloud Connection, configure and connect to an Everyware Cloud broker.

![image](https://github.com/user-attachments/assets/ab9af5f0-139a-484a-a58f-39a4da26cc6d)

4. On ESF create a new dedicated identity with the following credentials:

- name: `maintenance`
- password: `maintenance12345`

5. On ESF give this new user access to the Rest APIs (see screenshot below)

![image](https://github.com/user-attachments/assets/7d4c61ba-c56d-4609-8869-154cc88c70d1)

## Instructions

1. Create a new activity in Everyware Cloud (see Device Activities section) like the screenshot below. Be sure to customize the "Resource URL" to the correct location of the ZIP archive mentioned in the "Pre-requisites" section.

![image](https://github.com/user-attachments/assets/a26d1ed4-aca9-4c1d-8a90-24247b7e736b)

2. Under Everyware Cloud (EC5) > Devices select connected device

3. Under "Activity Update" open "New Update" and select the activity created at the step above:

![image](https://github.com/user-attachments/assets/b1e68a09-c39d-447b-9b7d-117f38400059)

4. Submit
