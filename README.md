# Hospital Management System

This website efficiently handles bookings, patient details, and doctor information.

## Code Editors
- VS Code

## Server
- XAAMP server for database

## Technologies Used
- Flask
- Jinja
- Bootstrap

## Database Connection
- SQLAlchemy ORM is used to connect Python with SQL databases, where tables are defined as classes in Python.

## Features
- All CRUD operations are implemented.
- Trigger database created to store every action and time of action (e.g., update, delete, insert).
- Email authentication is deployed in this project.

## Databases
1. **User**: For login and signup (general user information).
2. **Patient**: If a patient makes a booking, a confirmation email is sent to the patient's email and the booking details are updated. Changes like 'edit' or 'delete' are also allowed.
3. **Doctor**: To store the information about the specialty of doctors, which will reflect when choosing the type of doctor during bookings.
4. **Trigger**: Used to check actions of patients. If a patient books, the trigger database stores the action as an insertion; if a patient updates, it stores the action as an update; the same goes for delete. This database is used for backup purposes and to store actions of patients.

## Steps to Run This Project
1. In the `Config.json` file, provide your email ID and email password to send "booking confirmed" emails to the concerned patient.
2. Run the project on localhost: [http://127.0.0.1:5000/](http://127.0.0.1:5000/)



