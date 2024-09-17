# Mail My Details Cron Job

This repository contains scripts to collect data and send it via email using a cron job.

## Prerequisites

- Ubuntu 22.04 (or other Linux distributions)
- Installed and running `cron` service
- Git
- app password (update the app password and email in the send_email.sh file)

#### Generate App password
- Sign in to your Google account 
- Click Security 
- Under Signing in to Google, click App Passwords 
- Click Select app and choose the app 
- Click Select device and pick the device you're using 
- Click Generate 
- Follow the instructions to enter the app password 
- Tap Done 

## Installation

1. Install `cron`:

    ```bash
    sudo apt install cron
    ```

2. Start the `cron` service:

    ```bash
    sudo systemctl start cron
    ```

3. Check the status of `cron` (press `q` to exit):

    ```bash
    sudo systemctl status cron
    ```

4. Enable `cron` to start on boot:

    ```bash
    sudo systemctl enable cron
    ```

5. Clone the repository:

    ```bash
    git clone https://github.com/Nishan666/mail-my-details.git
    ```

6. Change into the repository directory:

    ```bash
    cd mail-my-details
    ```

7. Make the scripts executable:

    ```bash
    chmod +x send_email.sh collect_data.sh
    ```

## Setup Cron Jobs

1. Open the `crontab` editor:

    ```bash
    crontab -e
    ```

2. Choose your desired text editor and add the following lines at the end to set up the cron jobs:

    ```bash
    # Send details via email every hour
    0 * * * * $HOME/mail-my-details/send_email.sh nishankumar559@gmail.com >> $HOME/mail-my-details/cron.log 2>&1

    # Collect data every minute
    * * * * * $HOME/mail-my-details/collect_data.sh >> $HOME/mail-my-details/cron.log 2>&1
    ```
3. Replace nishankumar559@gmail.com with the desired recipient email address.

4. Save and exit the editor.

## Check Logs

To view the logs and monitor the cron job execution, use the following command:

```bash
tail -f /var/log/syslog
```