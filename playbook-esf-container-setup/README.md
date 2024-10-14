# Playbook to configure a Docker Container on ESF

This playbook shows how to configure a Docker container using Everyware Cloud.

## Instructions

- Customize the playbook with the correct credentials (username and password) to connect to ESF.
- Customize the playbook adding the needed configuration properties for the container to create (see [here](https://esf.eurotech.com/v7.6.0/docs/container-orchestration-provider-usage) for more details).
- Zip the folder content. The produced zip file must have the following files: **site.yml** and the **roles** folder in the root dir, not contained in any subfolder

## Distribution
Serve the produced zip file from your preferred http(s) server.
The link to the zip file then needs to be used as an input when generating the Ansible entry in Everyware Cloud (https://ec.eurotech.com/docs/device-activities#activity-definitions)