
####Creating a single instance on GCP with port 5000 open and a python flask service running.

You can connect to the instance using:

```ssh user@`terraform output ip` ```

To access the APP use curl:

```curl http://`terraform output ip`:5000```

####Debugging
To re-run the startup script in debug mode, use:

`sudo google_metadata_script_runner startup --debug`

####Setup

Adjust the information in provider.tf.

If needed, adjust the path for your local ssh public key.