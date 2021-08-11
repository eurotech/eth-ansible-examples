# Applying Software Assembly
Notes:
* This will remove and reinstall ESF from the gateway. All existing ESF configuration will be deleted. Backup your current configuration if you want to keep it. 
* This is designed for:   
  * ReliaGATE 10-14 running EL27.0.2 or EL27.1.0_RC4
  * ReliaGATE 10-12 running 

1. Create playbook with ```mkdist.sh --playbook```
3. Transfer ```/out/<playbook>.tar.gz``` and ```/freshrun.sh``` to a location on the gateway. ```/usr/src``` is a good folder to use. 
4. Ensure ```freshrun.sh``` has executable permission. 
5. Connect gateway to internet.
6. Verify gateway can connect to internet by doing a ```ping 8.8.8.8```
7. Run ```freshrun.sh```. It is normal for ```freshrun.sh``` to generate some docker errors similar to "That's not the right way to use the command". If you see docker errors similar to "Docker daemon not found/not running/unavailable", that means Docker is not currently running. Abort the script with Control + C, start Docker, and run the script again. 
8. Wait for the ansible script to finish running. 
9. Confirm that gateway is properly provisioned for EC, Exosite, connects to sensors and is sending data. 

# Creating Playbooks (general instructions)

General update playbook

The mkdist.sh script can package the playbook in different formats, suitable for various deployment methods, depending on the first argument:

* `--playbook`:
  Packages the playbook and required files in a tar.gz archive, the obtained playbook must be manually copied on target gateway and executed with the following command:

  ```
  ansible-playbook site.yml
  ```

* `--deploy-v2`:
  Produces a DEPLOY-V2 friendly self extracting script, the script will apply the playbook and create the verifier script in the appropriate folder to close the EC job and reboot the gateway if necessary.

  The mkdist script will print some of the parameters that should be used when creating the job, like package name, version and MD5 hash.

  It should be possible to deploy the produced script from EC5 using a `Package Download/Install` job with the following XML configuration:

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
   <downloadRequest>
      <uri>${uri}</uri>
      <name>${Package Name}</name>
      <version>${Package Version}/version>
      <install>true</install>
      <fileHash>MD5:${MD5 Hash value}</fileHash>
      <fileType>EXECUTABLE_SCRIPT</fileType>
   </downloadRequest>
  ```

  `ansible-playbook` stdout and sterr will append to `/opt/eurotech/esf/log/${Package Name}-${Package Version}.log`

  Where `${Package Name}`, `${Package Version}` and `${MD5 Hash value}` can be obtained from script output.
