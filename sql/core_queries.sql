-- =====================================
-- ConsentVault : Core SQL Queries
-- =====================================

-- 1. View all users
SELECT * FROM users;

-- 2. View all applications
SELECT * FROM applications;

-- 3. View all consent records
SELECT * FROM consent;

-- 4. View only active (granted) consents
SELECT *
FROM consent
WHERE consent_status = 'Granted';

-- 5. User-wise consent summary
-- Shows which user allowed which app to access which data
SELECT 
    u.name AS user_name,
    a.app_name,
    d.data_name,
    p.purpose_name,
    c.consent_status
FROM consent c
JOIN users u ON c.user_id = u.user_id
JOIN applications a ON c.app_id = a.app_id
JOIN data_types d ON c.data_type_id = d.data_type_id
JOIN purposes p ON c.purpose_id = p.purpose_id;

-- 6. Check if access is allowed (decision logic)
-- Used before allowing an app to access user data
SELECT 
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM consent
            WHERE user_id = 1
              AND app_id = 1
              AND data_type_id = 1
              AND consent_status = 'Granted'
        )
        THEN 'ACCESS ALLOWED'
        ELSE 'ACCESS DENIED'
    END AS access_decision;

-- 7. Revoke user consent (UPDATE)
UPDATE consent
SET consent_status = 'Revoked',
    revoked_at = CURRENT_TIMESTAMP
WHERE user_id = 1
  AND app_id = 1
  AND data_type_id = 2;

-- 8. Grant consent again (UPDATE)
UPDATE consent
SET consent_status = 'Granted',
    granted_at = CURRENT_TIMESTAMP,
    revoked_at = NULL
WHERE user_id = 1
  AND app_id = 1
  AND data_type_id = 2;

-- 9. View denied access attempts
SELECT 
    u.name,
    a.app_name,
    d.data_name,
    l.access_time,
    l.reason
FROM data_access_log l
JOIN users u ON l.user_id = u.user_id
JOIN applications a ON l.app_id = a.app_id
JOIN data_types d ON l.data_type_id = d.data_type_id
WHERE l.access_result = 'Denied';

-- 10. Delete old denied access logs (DELETE)
DELETE FROM data_access_log
WHERE access_result = 'Denied';
