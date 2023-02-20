# Configure devkit mode in ESF

This playbook can be executed locally or from remote (enabling the eth-update role) to uninstall the current ESF and install 7.2.2 with provisioning enabled.

The playbook exposes few properties:
- esf_version
- el_version
- el_arch

That are needed to identify the package to install. In this case it defaults for a ReliaGATE 10-12 with EL 27.1.0.
The properties can be overwritten during playbook invocation (feature not available for remote updates)

Additional variables available are: 
- esf_installer_filename
- esf_snapshots_dir

The playbook can also restart the gateway. But the feature is currently commented.

The ESF installer must be present on the same folder of the playbook prior to the playbook execution.

The playbook installs the ESF RPM using DNF. Prior to the ESF installation, DNF cache is refreshed to load the EL GPG keys. Internet connection may be needed.
If the Internet connection is not available, the DNF commands can be removed and the installation phase replaced with `rpm -ivh --nosignature <path>` 
