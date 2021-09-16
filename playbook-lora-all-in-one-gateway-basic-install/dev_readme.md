ToDo:
* Add notice to documentation that ESF web console if open during installation may show "failed to install package" (CONFIRM THIS ERROR) if the packages are already installed. This can be safely ignored. 
* Document passing in custom ESF credentials
* document that docker logging is NOT enabled if daemon.json already exists!
* document lora installer file version
* document that for 6.2.0, ansible package must be installed and configured with user assets;deploy;configuration
* document that for 6.2.0, log file must be used (no journal)

* Verify that NPE after API config changes is resolved in ESF 7 RC Release 80 (RC5?). Talk to Marcello Martina if not.
* Add Kura restart after firewall config change? This is only needed until the fix above is implemented in ESF.

* adjust REST fail messages to point to troubleshooting section of documentation?

* Add link to gh-docs for documentation. 

MQTT Broker Credentials
UN: LoRaMQTTUser
PW: LoRaMQTTpw

PostGres Credentials:
NS_Login_PW: CNSpwLoRa
AS_Login_PW: CASpwLoRa

