This version assumes 10-14, EL 27.1.0, ESF 7.0.0 RC

ToDo:
* add gateway setup to chirpstack configuration
* Handle ESF login passwords (default of serial number, but may be different, how to handle with EC/automated deployment?)
* Change to API for installing packages
* Correct "changed when" on docker commands and other command/shell invocations  
* ESF interfering with Docker still in ESF 7!
* Implement docker log rotation https://docs.docker.com/config/containers/logging/json-file/
* Add notice to documentation that ESF web console if open during installation may show "failed to install package" (CONFIRM THIS ERROR) if the packages are already installed. This can be safely ignored. 

MQTT Broker Credentials
UN: LoRaMQTTUser
PW: LoRaMQTTpw

PostGres Credentials:
NS_Login_PW: CNSpwLoRa
AS_Login_PW: CASpwLoRa

