General update playbook

**Note**: This folder must be in a path with no spaces or special characters, otherwise the build may encounter errors. 

## Preparing for Build
1. Put your GPG key in the /playbook/files folder. This file must be named exactly `gpgpub.key`
2. If desired, modify the following lines in mkdist.sh (line 20 and 21) to adjust package name and version:  
`UPDATE_NAME=xylem-update-pgpkey`  
`UPDATE_VERSION=0.1.0`

Modifying any other lines can result in undefined behavior. 

## Build
Run the mkdist.sh script from a terminal/command line. This can package the playbook in different formats, suitable for various deployment methods, depending on the first argument. 

Supported Arguments:
* `--playbook`:
  Packages the playbook and required files in a tar.gz archive that can be manually copied to the gateway. 

* `--deploy-v2`:
  Produces a DEPLOY-V2 friendly self extracting script, the script will apply the playbook and create the verifier script in the appropriate folder to close the EC job and reboot the gateway if necessary.

  The mkdist script will print some of the parameters that should be used when creating the job, like package name, version and MD5 hash. These will be required below in the Deploy instructions.   

* `--clean`:
  This will clean the working directory. This will be required anytime you remove or relocate files from the build. If you don't run a clean, the old files will be included in the new build. If you are experiencing build issues, the first step for troubleshooting is running a `--clean` and rebuilding. This is not required for adding or modifying files.

## Deploy
### Manual Deploy and Run
1. Follow instructions above for `--playbook`.
2. Copy the outputted playbook .tar.gz to the gateway. 
3. Extract the .tar.gz on the gateway. 
4. Run the playbook with the following command:  
        
        ansible-playbook site.yml

### Everyware Cloud
1. Follow the steps above for `--deploy-v2`.
2. Host the outputted self-extracting script file on a web server that will be accessible from the gateway, such as an S3 bucket. The URI for this file will be used below.  
    **Note:** This file must be hosted on a web server; using a local file URI will result in an error. If using a local file is required for testing/debug purposes, this can be achieved by using a node.js httpserver on your computer to host the file.
3. Modify the following xml snippet. It is recommended to save this snippet as it will be put in the Everyware Cloud Batch Job configuration.  

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <downloadRequest>
        <uri>${uri}</uri>
        <name>${Package Name}</name>
        <version>${Package Version}</version>
        <install>true</install>
        <fileHash>MD5:${MD5 Hash value}</fileHash>
        <fileType>EXECUTABLE_SCRIPT</fileType>
    </downloadRequest>
    ```

    You need to replace the following fields manually (replace the entire field including `${}` with the replacement value and ensure there is no extra whitespace):
    |Field|Replacement|
    |-----|-----------|
    |`${uri}`| The URI of the self-extracting script file. Must be a web host URI (local file URI will result in error) |
    |`${Package Name}`|The package name outputted to the command line during a build|
    |`${Package Version}`|The package version outputted to the command line during a build|
    |`${MD5 Hash value}`| The MD5 hash outputted to the command line during a build. This will change with every build. **Note:** Leave the "MD5:" at the start of this field.
4. Log in to Everywarecloud and select the "Batch Jobs" page.
5. Click the "+ Add" button. 
6. Give the batch job a name (and description if desired). 
7. Click on the batch job you just created to select it. 
8. Select the "Steps" tab (in the lower half of the page). 
9. Click the "+ Add" button to add a new step. Note: This is the add button near the Steps tab, not the add button you clicked on the top half of the page to create a new batch job.
10. Enter a name (and description if desired) for the step. 
11. Choose "Package Download/Install" from the "Step Definition" dropdown. 
12. Copy and paste the XML snippet you prepared in step 3 into the "Package Download Request" textbox. **Note:** There must be no leading or trailing whitespace in this textbox. 
13. Click the "Submit" button
14. Click the "Targets" tab. 
15. Click "+ Add" to add target gateways. Choose the target gateway(s) you want to deploy the script to. This will add the gateways to the list of targets. 
16. Select one or more gateways on the list and click the "Start" button to begin deployment. 

#### Troubleshooting
Basic troubleshooting can be achieved by going to the "Executions" tab, selecting the execution to troubleshoot, and clicking the "Log" button. 

In addition, the playbook will create output files that can be used for troubleshooting:  
The playbook's stdout and sterr will append to `/opt/eurotech/esf/log/${Package Name}-${Package Version}.log`