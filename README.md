# Database Backup Script

This script automates the process of creating MySQL database backups and securely transferring them to an external server.

## Features

-   **Automated Backup:** Backs up all MySQL databases automatically.
-   **Compression:** Compresses backups into a single, manageable archive.
-   **Secure Transfer:** Securely transfers the backup to a remote server using `scp`.
-   **Local Cleanup:** Deletes local backup files after successful transfer, ensuring disk space efficiency.

## Prerequisites

-   Linux-based system with Bash.
-   `mysql-client` installed.
-   SSH access to the remote server.
-   Sufficient permissions to execute `mysqldump` and `scp`.

## Installation & Usage

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/vini4huk/backup_db.git
    cd backup_db
    ```

2.  **Make the Script Executable:**

    ```bash
    chmod +x backup_db.sh
    ```

3.  **Run the Script:**

    ```bash
    ./backup_db.sh
    ```

## Configuration

-   **Remote Server Credentials:**
    Modify the `scp` command within the `backup_db.sh` script to specify your remote server's hostname, username, and destination directory.

    ```bash
    scp backup.tar.gz user@remote_server:/path/to/remote/directory/
    ```

    Replace `user@remote_server:/path/to/remote/directory/` with your actual server information.

-   **MySQL Privileges:**
    Ensure the MySQL user executing this script has the necessary privileges to perform database dumps.

## Automating Backups with Cron

To schedule automatic backups, use `cron`.

1.  **Open the Cron Editor:**

    ```bash
    crontab -e
    ```

2.  **Add a Cron Job:**
    Add the following line to run the script daily at midnight:

    ```cron
    0 0 * * * /path/to/backup_db/backup_db.sh
    ```

    Replace `/path/to/backup_db/backup_db.sh` with the actual path to your script.

3.  **Save and Exit:**
    Save the changes and exit the cron editor. The script will now run automatically according to the schedule.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please feel free to submit a pull request or open an issue.
