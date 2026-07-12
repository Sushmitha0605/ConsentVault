-- =====================================
-- ConsentVault : Sample Data Insertion
-- =====================================

-- USERS
INSERT INTO users (name, email, phone) VALUES
('Aarav Kumar', 'aarav@example.com', '9876543210'),
('Meera Sharma', 'meera@example.com', '9123456789'),
('Rohan Verma', 'rohan@example.com', '9988776655'),
('Ananya Iyer', 'ananya@example.com', '8899776655'),
('Kiran Rao', 'kiran@example.com', '9012345678');

-- APPLICATIONS
INSERT INTO applications (app_name, organization) VALUES
('HealthTrack App', 'HealthTech Pvt Ltd'),
('FitLife App', 'Wellness Solutions');

-- DATA TYPES
INSERT INTO data_types (data_name, sensitivity_level) VALUES
('Email', 'Low'),
('Phone Number', 'Medium'),
('Location', 'Medium'),
('Medical Records', 'High');

-- PURPOSES
INSERT INTO purposes (purpose_name) VALUES
('User Authentication'),
('Personalized Services'),
('Analytics'),
('Health Monitoring');

-- CONSENT RECORDS
INSERT INTO consent
(user_id, app_id, data_type_id, purpose_id, consent_status, granted_at)
VALUES
(1, 1, 1, 1, 'Granted', CURRENT_TIMESTAMP),
(1, 1, 2, 2, 'Granted', CURRENT_TIMESTAMP),
(1, 2, 3, 3, 'Granted', CURRENT_TIMESTAMP),

(2, 1, 4, 4, 'Revoked', CURRENT_TIMESTAMP),
(2, 2, 1, 1, 'Granted', CURRENT_TIMESTAMP),

(3, 1, 2, 2, 'Granted', CURRENT_TIMESTAMP),
(3, 1, 3, 3, 'Revoked', CURRENT_TIMESTAMP),

(4, 2, 4, 4, 'Granted', CURRENT_TIMESTAMP),
(4, 1, 1, 1, 'Granted', CURRENT_TIMESTAMP),

(5, 2, 2, 2, 'Granted', CURRENT_TIMESTAMP);

-- DATA ACCESS LOGS
INSERT INTO data_access_log
(user_id, app_id, data_type_id, access_result, reason)
VALUES
(1, 1, 1, 'Allowed', 'Consent granted'),
(1, 2, 3, 'Allowed', 'Consent granted'),
(2, 1, 4, 'Denied', 'Consent revoked'),
(2, 2, 1, 'Allowed', 'Consent granted'),
(3, 1, 3, 'Denied', 'Consent revoked'),
(3, 1, 2, 'Allowed', 'Consent granted'),
(4, 2, 4, 'Allowed', 'Consent granted'),
(4, 1, 1, 'Allowed', 'Consent granted'),
(5, 2, 2, 'Allowed', 'Consent granted'),
(5, 1, 1, 'Denied', 'No active consent');
