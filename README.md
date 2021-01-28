# LibreNMS Speedtest
A Speedtest plugin for LibreNMS, built with RRD and Speedtest CLI by Ookla

## Introduction
This is a plugin that enables internet uplink bandwidth graphing in a LibreNMS dashboard. It uses Ookla servers to perform the speedtest by calling Ookla's Speedtest CLI application. Data is stored in the backend into RRD and is visualized by using a LibreNMS style dashboard.
Installation should be pretty straight forward.<br/><br/>
Screenshot:<br/>
<img src="https://gitlab.com/jackgreyhat/librenms-speedtest/-/raw/master/images/dashboard-screenshot.png" width="800" height="400"/>
<br/>
## Installation
### Plugin Prerequisites
- A working LibreNMS installation. :D
- Shell access to the LibreNMS server.
- Speedtest CLI by Ookla. To install this, use the following link and instructions:
    - https://www.speedtest.net/apps/cli
    - Verify you are running Speedtest CLI by Ookla by issuing the following command on your CLI:<br/>
        ```
        speedtest --version
        ```
      Expected example output: <br/>
        ```
        Speedtest by Ookla 1.0.0.2 (5ae238b) Linux/x86_64-linux-musl 5.4.0-64-generic x86_64
        
        The official command line client for testing the speed and performance
        of your internet connection.

        ```
      Note:<br/>
      There is also the "speedtest-cli" package, which is possibly provided by your distribution's repository. This package, however, does not follow the same cli commands as the Ookla's Speedtest CLI package and is built with Python. It is known to under perform in some cases.<br/>
      This dashboard will not work out of the box with the "speedtest-cli" package. Prefer to install Ookla's package.

### Plugin Installation
NOTE: These instructions assume you are the root user. If you are not, prepend sudo to the shell commands or temporarily become a user with root privileges.
- Login to your LibreNMS' server CLI.
- Go to your home dir: `cd ~/`
- Clone this repository into your home dir: `git clone https://gitlab.com/jackgreyhat/librenms-speedtest.git`
- Create the plugin directory into LibreNMS' plugin folder: `mkdir /opt/librenms/html/plugins/Speedtest`
- Copy the LibreNMS speedtest plugin contents into the newly created directory: `cp -r ~/librenms-speedtest/. /opt/librenms/html/plugins/Speedtest`
- Ensure correct ownership and permissions on the Speedtest plugin directory and files:
```
chown -R librenms:librenms /opt/librenms/html/plugins/Speedtest
chmod -R --reference=/opt/librenms/html/plugins/Test /opt/librenms/html/plugins/Speedtest
chmod +x /opt/librenms/html/plugins/Speedtest/librenms-speedtest.sh
```

