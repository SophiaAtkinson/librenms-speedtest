# Install speedtest pkg
sudo apt-get install curl
sudo apt remove speedtest-cli
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest
# Go to your home dir
cd ~/
# Clone this repository into your home dir
git clone https://git.oldgate.org/Sophia/librenms-speedtest
# Create the plugin directory into LibreNMS plugin folder
mkdir /opt/librenms/html/plugins/Speedtest
# Copy the LibreNMS speedtest plugin contents into the newly created directory
cp -r ~/librenms-speedtest/. /opt/librenms/html/plugins/Speedtest
# Ensure correct ownership and permissions on the Speedtest plugin directory and files
chown -R librenms:librenms /opt/librenms/html/plugins/Speedtest
chmod -R --reference=/opt/librenms/html/plugins /opt/librenms/html/plugins/Speedtest
chmod +x /opt/librenms/html/plugins/Speedtest/librenms-speedtest.sh
# Accept the speedtest EULA and GDPR notice (if applicable) and run an initial speedtest
su -c 'speedtest --accept-license --accept-gdpr' librenms
# Create the RRD files
su -c 'bash /opt/librenms/html/plugins/Speedtest/librenms-speedtest.sh create' librenms
# Test and run the speedtest script
su -c 'bash /opt/librenms/html/plugins/Speedtest/librenms-speedtest.sh run' librenms
# Output the speedtest results into PNG files
su -c 'bash /opt/librenms/html/plugins/Speedtest/librenms-speedtest.sh graph' librenms
