# ConsentVault

## Overview

ConsentVault is a database-driven web application developed to demonstrate how user consent and data access can be managed using a relational database. The project combines a Flask backend, SQLite database, and a simple web interface to perform CRUD operations and illustrate core DBMS concepts.

---

## Features

- User management
- Application management
- Consent tracking
- Data access logging
- CRUD operations
- REST API integration
- Relational database design

---

## Technologies Used

- Python
- Flask
- SQLite
- HTML
- CSS
- JavaScript
- DB Browser for SQLite

---

## Project Structure

```text
ConsentVault/
│
├── backend/
├── frontend/
├── schema/
├── sql/
├── consentvault.db
├── README.md
└── .gitignore
```

---

## Database Design

The database consists of the following tables:

- Users
- Applications
- Data Types
- Consent
- Data Access Log

Foreign keys are used to maintain relationships between tables and reduce data redundancy through normalization.

---

## CRUD Operations

- Create – Add new users
- Read – View users, applications, and consent records
- Update – Planned for future implementation
- Delete – Remove users

---

## How to Run

1. Clone the repository.

```bash
git clone https://github.com/YOUR_USERNAME/ConsentVault.git
```

2. Navigate to the backend folder.

```bash
cd backend
```

3. Install the required packages.

```bash
pip install flask flask-cors
```

4. Start the Flask application.

```bash
python app.py
```

5. Open the frontend in your browser.

---

## Learning Outcomes

This project helped me gain practical experience with:

- Relational database design
- SQL queries and joins
- CRUD operations
- Flask API development
- Connecting frontend and backend
- SQLite database management

---

## Future Improvements

- User authentication
- Complete consent approval workflow
- Update functionality
- Improved user interface
- Role-based access control

---

## License

Developed for educational purposes.