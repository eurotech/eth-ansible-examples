ToDo:
* ESF interfering with Docker still in ESF 7!
* Add notice to documentation that ESF web console if open during installation may show "failed to install package" (CONFIRM THIS ERROR) if the packages are already installed. This can be safely ignored. 
* Document passing in custom ESF credentials
* document that docker logging is NOT enabled if daemon.json already exists!
* document lora installer file version
* document that for 6.2.0, ansible package must be installed and configured with user assets;deploy;configuration

* Add Error 503 (API not ready yet) error handling for invoking script too soon after Kura startup
* adjust REST fail messages to point to troubleshooting section of documentation

MQTT Broker Credentials
UN: LoRaMQTTUser
PW: LoRaMQTTpw

PostGres Credentials:
NS_Login_PW: CNSpwLoRa
AS_Login_PW: CASpwLoRa

