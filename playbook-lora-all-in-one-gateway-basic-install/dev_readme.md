This version assumes 10-14, EL 27.1.0, ESF 7.0.0 RC

ToDo:
* ESF interfering with Docker still in ESF 7!
* Implement docker log rotation https://docs.docker.com/config/containers/logging/json-file/
* Add notice to documentation that ESF web console if open during installation may show "failed to install package" (CONFIRM THIS ERROR) if the packages are already installed. This can be safely ignored. 
* Remove unneeded debug outputs
* Document passing in custom ESF credentials
* Adjust ESF major version parsing to be regex (if possible)
* document that docker logging is NOT enabled if daemon.json already exists!

MQTT Broker Credentials
UN: LoRaMQTTUser
PW: LoRaMQTTpw

PostGres Credentials:
NS_Login_PW: CNSpwLoRa
AS_Login_PW: CASpwLoRa

