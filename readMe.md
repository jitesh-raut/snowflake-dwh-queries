# Snowflake SQL Development Environment with VS Code & Git

This guide walks you through setting up a local development environment to write, execute, and version-control Snowflake SQL queries using **Visual Studio Code**, **Git**, and the **Snowflake** extension.

## Step-by-Step Setup

### 1. Setup Repository in VS Code
1. **Install VS Code**

    1. **Go to the official site**:
   Visit [https://code.visualstudio.com](https://code.visualstudio.com)

    2. **Download the installer**:
   Click on the **"Download for Windows"** button to get the `.exe` installer.

    3. **Run the installer**:
   Double-click the downloaded `.exe` file.

    4. **Follow setup instructions**:

        * Accept the license agreement.
        * Choose install location.
        * **Optional**: Check boxes for “Add to PATH”, “Add ‘Open with Code’ to context menu”.

    5. **Click ‘Install’**, then **‘Finish’**.

    6. **Launch VS Code**:
   Use the Start menu or desktop shortcut.

1. **Create or Clone a Git Repository**

    Open Terminal in VS Code (ctrl+`) and execute below commands:

   ```bash
   git clone https://github.com/your-username/snowflake-dwh-queries.git
   cd snowflake-dwh-queries
   ```

1. **Create folder structure**

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
## Use Cases of Version Control

### 1. **Version Control for DWH Logic**

Track changes to:

* DDL scripts (create/alter tables, views)
* DML scripts (insert/update/delete)
* Business logic (stored procedures, UDFs, views)
* Comment history, rollback, and code reviews

---

### 2. **Team Collaboration**

* Collaborate on query development using Git branches and pull requests
* Perform peer code reviews for data quality and logic validation
* Enforce standards with pre-commit hooks or linters

---

### 3. **Release Management / CI-CD**

* Automate deployment of SQL changes via Git workflows (e.g., GitHub Actions, Azure DevOps)
* Use tools like **SchemaChange**, **Liquibase**, or **Flyway** for managing schema migrations
* Tag and release versions of your data models

---

### 4. **Development-Test-Prod Promotion**

* Maintain separate folders or branches for dev, staging, and production environments
* Use environment-specific Snowflake connections in `.toml` profiles
* Automate promotion using scripts

---

### 5. **Metadata & Data Lineage Tracking**

* Document table-level metadata
* Use consistent naming and folder conventions
* Integrate with data catalog tools (e.g., Alation, Atlan) using SQL codebase

---

### 6. **Audit & Compliance**

* Maintain audit trails of who changed what, when, and why
* Prove compliance with change management policies in regulated environments (e.g., HIPAA, GDPR, SOX)

---

### 7. **Template and Boilerplate Scripts**

* Share reusable SQL templates for creating standard tables, SCD patterns, CDC patterns, etc.
* Onboard new developers with starter kits

---

### 8. **Testing SQL Logic**

* Store test datasets as insert scripts
* Write SQL unit tests using tools like [dbt tests](https://docs.getdbt.com/docs/build/tests) or manual assertions
