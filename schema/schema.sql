-- ConsentVault Database Schema
-- SQLite compatible

-- USERS TABLE
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- APPLICATIONS TABLE
CREATE TABLE applications (
    app_id INTEGER PRIMARY KEY AUTOINCREMENT,
    app_name TEXT NOT NULL,
    organization TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- DATA TYPES TABLE
CREATE TABLE data_types (
    data_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_name TEXT NOT NULL,
    sensitivity_level TEXT CHECK (sensitivity_level IN ('Low', 'Medium', 'High'))
);

-- PURPOSES TABLE
CREATE TABLE purposes (
    purpose_id INTEGER PRIMARY KEY AUTOINCREMENT,
    purpose_name TEXT NOT NULL
);

-- CONSENT TABLE
CREATE TABLE consent (
    consent_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    data_type_id INTEGER NOT NULL,
    purpose_id INTEGER NOT NULL,
    consent_status TEXT CHECK (consent_status IN ('Granted', 'Revoked')),
    granted_at DATETIME,
    revoked_at DATETIME,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (app_id) REFERENCES applications(app_id),
    FOREIGN KEY (data_type_id) REFERENCES data_types(data_type_id),
    FOREIGN KEY (purpose_id) REFERENCES purposes(purpose_id)
);

-- DATA ACCESS LOG TABLE
CREATE TABLE data_access_log (
    log_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    data_type_id INTEGER NOT NULL,
    access_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    access_result TEXT CHECK (access_result IN ('Allowed', 'Denied')),
    reason TEXT,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (app_id) REFERENCES applications(app_id),
    FOREIGN KEY (data_type_id) REFERENCES data_types(data_type_id)
);
