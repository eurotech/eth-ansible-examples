As of 11-4-2021 this file is mostly deprecated and will no longer be updated. Issues have been transferred to Jira, and are now exclusively managed in Jira. 
https://eurotech.atlassian.net/browse/EINCSE-75

ToDo:
* Parse and adjust docker daemon.json instead of assuming logging is enabled if the file already exists. (In Jira)
* Change the wire graph snapshot to merging in instead of replacing, or remove entirely. (In Jira)

* Add notice to documentation that ESF web console if open during installation may show "failed to install package" (CONFIRM THIS ERROR) if the packages are already installed. This can be safely ignored. (In Jira)
* Document passing in custom credentials (In Jira)
* document that docker logging is NOT enabled if daemon.json already exists! (In Jira)
* document lora installer file version (In Jira)
* document that for 6.2.0, ansible package must be installed and configured with user assets;deploy;configuration (In Jira)
* document that for 6.2.0, log file must be used (no journal) (In Jira)
* document that wire graph components may need to be remade after an update (In Jira)
* document that playbook must be run as root or with sudo (In Jira)

* Verify that NPE after API config changes is resolved in ESF 7 RC Release 80 (RC5?). Talk to Marcello Martina if not. (In Jira)
* Add Kura restart after firewall config change? This is only needed until the fix above is implemented in ESF. (In Jira)
* Allow for kura.log or journald logging on ESF 6.2.0 (In Jira)

* adjust REST fail messages to point to troubleshooting section of documentation? (In Jira)

* Add link to gh-docs for documentation.

need to document:
-ansible supplement package installed...default username/password (In Jira)
-some of the wait for startup stuff will show failures until a success, that is normal (In Jira)

MQTT Broker Credentials
UN: LoRaMQTTUser
PW: LoRaMQTTpw

PostGres Credentials:
NS_Login_PW: CNSpwLoRa
AS_Login_PW: CASpwLoRa

