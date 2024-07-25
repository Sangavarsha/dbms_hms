# Hospital Management System

This website efficiently handles bookings, patient details, and doctor information.

## Code Editors
- **VS Code**

## Server
- **XAAMP server** for database

## Technologies Used
- **Flask**
- **Jinja**
- **Bootstrap**

## Database Connection
- **SQLAlchemy ORM** is used to connect Python with SQL databases, where tables are defined as classes in Python.

## Features
- All CRUD operations are implemented.
- A trigger database is created to store every action and the time of action (e.g., update, delete, insert).
- **Email authentication** is deployed in this project to confirm bookings.

## Databases
1. **User**: For login and signup (general user information).
2. **Patient**: Stores patient booking details. An email confirmation is sent to the patient's email. Supports editing and deleting bookings.
3. **Doctor**: Stores information about the doctor's specialty, which is used when selecting a doctor type during bookings.
4. **Trigger**: Used to log patient actions. The database records insertion for new bookings, updates for changes, and deletions for cancellations. This database serves as a backup and logs patient activities.

## Steps to Run This Project
1. Edit the `Config.json` file to provide your email ID and password to enable sending "booking confirmed" emails to the concerned patient.
2. Start the project on localhost: [http://127.0.0.1:5000/](http://127.0.0.1:5000/)

## Additional Setup
- Ensure the XAAMP server is running and the necessary databases are created.
- Install the required Python packages:
  ```bash
  pip install flask sqlalchemy flask_sqlalchemy flask_mail
  Required tools are thier in main .py install them according ly
