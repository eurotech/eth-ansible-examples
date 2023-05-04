# Playbook to upgrade ESF with RPM

This playbook shows how to embed an rpm in a playbook package to be then distributed via Everyware Cloud.

## Instructions

- Download the ESF RPM for your target version
- Copy it in the same folder as this README file. (It must be in the same directory as the site.yml file)
- Rename the downloaded RPM as esf.rpm
- Zip the folder content. The produced zip file must have the following files: **site.yml**, **esf.rpm** and the **roles** folder in the root dir, not contained in any subfolder

## Distribution
Serve the produced zip file from your preferred http(s) server.
The link to the zip file then needs to be used as an input when generating the Ansible entry in Everyware Cloud (https://ec.eurotech.com/docs/device-activities#activity-definitions)