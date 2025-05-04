# Snowflake SQL Development Environment with VS Code & Git

This guide walks you through setting up a local development environment to write, execute, and version-control Snowflake SQL queries using **Visual Studio Code**, **Git**, and the **Snowflake** extension.

## Step-by-Step Setup

### 1. Setup Repository in VS Code

1. **Create or Clone a Git Repository**

   ```bash
   git clone https://github.com/your-username/snowflake-dwh-queries.git
   cd snowflake-dwh-queries
   ```

2. **Open the project in VS Code**

   ```bash
   code .
   ```

3. **Initialize Git (if not already done)**

   ```bash
   git init
   ```

4. **Create folder structure**

   ```
   mkdir queries
   touch README.md
   ```

---

### 2. Install Snowflake Extension for VS Code

1. Open the **Extensions** tab in VS Code (`Ctrl + Shift + X`)
2. Search for **"Snowflake"** [link to Extension](https://marketplace.visualstudio.com/items/?itemName=snowflake.snowflake-vsc)
3. Click **Install**

> This extension allows you to connect to Snowflake and execute SQL queries directly within VS Code.

---

### 3. Authenticate Snowflake in VS Code

1. Press `Ctrl+Shift+P` (Command Palette), then search for:

   ```
   Snowflake: Edit Connection File
   ```

This can be done using Snowflake extension user interface too.

2. Provide the required connection details:

   * **Account**: `xy12345.east-us-2.azure` (replace with your Snowflake account locator)
   * **Username/Password**: Your Snowflake credentials
   * **Warehouse**: `COMPUTE_WH` (or your configured warehouse)
   * **Database**: `DEMO_DB`
   * **Schema**: `PUBLIC`
   * **Role** *(optional)*: `SYSADMIN`

3. Save the connection as a named profile (e.g., `my_snowflake`).

4. A `.toml` file will be auto-generated at location : `C:\Users\your_user\.snowflake\connections.toml`

   ```toml
   [connections.my_snowflake]
   account = "xy12345.east-us-2.azure"
   user = "your_username"
   password = "your_password"
   role = "SYSADMIN"
   warehouse = "COMPUTE_WH"
   database = "DEMO_DB"
   schema = "PUBLIC"
   ```

---

### 4. Write and Execute SQL Queries

1. Create SQL files inside the `queries/` folder:

   ```bash
   touch queries/01_create_tables.sql
   ```

2. Example content:

   ```sql
   CREATE OR REPLACE TABLE employees (
     id INT,
     name STRING,
     department STRING,
     hire_date DATE
   );
   ```

3. To run the query:

   * Open the `.sql` file
   * Right-click anywhere inside the editor
   * Select **"Execute Query in Snowflake"**

> The output appears in the **Results** tab within VS Code.

---

### 5. Commit SQL Code and Push to Git Repository

1. Add changes:

   ```bash
   git add .
   ```

2. Commit with a message:

   ```bash
   git commit -m "Added initial SQL table creation script"
   ```

3. Push to remote:

   ```bash
   git push origin main
   ```

> Use GitHub/GitLab/Bitbucket as the remote to store and collaborate on your SQL codebase.

---

## Example Project Structure

```
snowflake-dwh-queries/
│
├── queries/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   └── ...
└── README.md              # This documentation
```