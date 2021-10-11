ToDo:
* Parse and adjust docker daemon.json instead of assuming logging is enabled if the file already exists. 
* Change the wire graph snapshot to merging in instead of replacing, or remove entirely. 

* Add notice to documentation that ESF web console if open during installation may show "failed to install package" (CONFIRM THIS ERROR) if the packages are already installed. This can be safely ignored. 
* Document passing in custom ESF credentials
* document that docker logging is NOT enabled if daemon.json already exists!
* document lora installer file version
* document that for 6.2.0, ansible package must be installed and configured with user assets;deploy;configuration
* document that for 6.2.0, log file must be used (no journal)
* document that wire graph components may need to be remade after an update
* document that playbook must be run as root or with sudo

* Verify that NPE after API config changes is resolved in ESF 7 RC Release 80 (RC5?). Talk to Marcello Martina if not.
* Add Kura restart after firewall config change? This is only needed until the fix above is implemented in ESF.
* Allow for kura.log or journald logging on ESF 6.2.0

* adjust REST fail messages to point to troubleshooting section of documentation?

* Add link to gh-docs for documentation. 

* Pull correct chirpstack (and other?) images for architecture 

* Add EL 27.1 support to 10-12
* Add ESF 7 support to 10-12? Is this needed or does it already exist?

need to document:
-ansible supplement package installed
-change rest password to admin if gateway doesn't have default password for EFS 6
-some of the wait for startup stuff will show failures until a success, that is normal

MQTT Broker Credentials
UN: LoRaMQTTUser
PW: LoRaMQTTpw

PostGres Credentials:
NS_Login_PW: CNSpwLoRa
AS_Login_PW: CASpwLoRa

