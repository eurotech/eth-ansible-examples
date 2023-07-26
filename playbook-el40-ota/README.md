# Playbook to upgrade EL to EL 40 and migrate ESF to a generic profile

This playbook shows how to upgrade EL 27.1.0 to EL 40 and migrate ESF to a generic profile via Everyware Cloud.

## Instructions

- Zip the folder content. The produced zip file must have the following files: **site.yml**, **esf.rpm** and the **roles** folder in the root dir, not contained in any subfolder

## Distribution
Serve the produced zip file from your preferred http(s) server.
The link to the zip file then needs to be used as an input when generating the Ansible entry in Everyware Cloud (https://ec.eurotech.com/docs/device-activities#activity-definitions)