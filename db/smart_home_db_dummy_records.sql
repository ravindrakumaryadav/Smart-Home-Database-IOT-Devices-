use smart_home_db;

-- Insert dummy records in users table
INSERT INTO users (first_name, last_name, email, user_password, phone, created_at, is_active) VALUES
('James',   'Wilson',   'james.wilson@gmail.com',    '$2b$12$LQv3c1yqBWVHxkd0LHarvd',  '07700900001', '2024-01-10 09:00:00', 1),
('Sarah',   'Ahmed',    'sarah.ahmed@gmail.com',     '$2b$12$KQv3c1yqBWVHxkd0LHarvd',  '07700900002', '2024-01-15 10:30:00', 1),
('Michael', 'Patel',    'michael.patel@outlook.com', '$2b$12$JQv3c1yqBWVHxkd0LHarvd',  '07700900003', '2024-02-01 08:45:00', 1),
('Emily',   'Johnson',  'emily.johnson@yahoo.com',   '$2b$12$IQv3c1yqBWVHxkd0LHarvd',  '07700900004', '2024-02-14 11:00:00', 1),
('David',   'Thompson', 'david.thompson@gmail.com',  '$2b$12$HQv3c1yqBWVHxkd0LHarvd',  '07700900005', '2024-03-05 14:20:00', 1);


-- Insert Dummy records in homes table
INSERT INTO homes (user_id, home_name, address, wifi_ssid, wifi_password, created_at) VALUES
(1, 'Wilson Family Home',  '12 Oak Street, Birmingham, B1 1AA',     'Wilson_HomeNet_5G',  'W!ls0nH0me2024',  '2024-01-10 09:30:00'),
(2, 'Sarah Ahmed Flat',    '45 Maple Avenue, London, E1 2BB',       'Ahmed_WiFi_Home',    'S@rahW1f12024',   '2024-01-15 11:00:00'),
(3, 'Patel Residence',     '78 Pine Road, Manchester, M1 3CC',      'PatelHome_Network',  'P@t3lH0me2024',   '2024-02-01 09:15:00'),
(4, 'Johnson Cottage',     '33 Birch Lane, Bristol, BS1 4DD',       'Johnson_WiFi_5G',    'J0hns0nC0tt2024', '2024-02-14 12:00:00'),
(1, 'Wilson Holiday Home', '99 Sea View Road, Cornwall, TR1 5EE',   'Wilson_Holiday_Net', 'W!ls0nH0l2024',   '2024-03-05 15:00:00');


-- Insert dummy records into devices table
INSERT INTO devices (home_id, device_name, device_type, status, ip_address, firmware_ver, installed_at) VALUES
-- Home 1 (Wilson Family Home)
(1, 'Living Room Light',     'light',      'on',      '192.168.1.10', 'v2.1.3', '2024-01-12 10:00:00'),
(1, 'Front Door Camera',     'camera',     'on',      '192.168.1.11', 'v3.0.1', '2024-01-12 10:15:00'),
(1, 'Front Door Lock',       'lock',       'off',     '192.168.1.12', 'v1.5.2', '2024-01-12 10:30:00'),
(1, 'Main Thermostat',       'thermostat', 'on',      '192.168.1.13', 'v4.2.0', '2024-01-12 10:45:00'),
(1, 'Kitchen Smart Plug',    'appliance',  'off',     '192.168.1.14', 'v1.0.5', '2024-01-12 11:00:00'),
(1, 'Bedroom Light',         'light',      'off',     '192.168.1.15', 'v2.1.3', '2024-01-12 11:15:00'),
(1, 'Garden Motion Sensor',  'sensor',     'on',      '192.168.1.16', 'v1.2.0', '2024-01-12 11:30:00'),
-- Home 2 (Sarah Ahmed Flat)
(2, 'Lounge Light',          'light',      'on',      '192.168.2.10', 'v2.1.3', '2024-01-17 09:00:00'),
(2, 'Doorbell Camera',       'camera',     'on',      '192.168.2.11', 'v3.0.1', '2024-01-17 09:15:00'),
(2, 'Smart Door Lock',       'lock',       'off',     '192.168.2.12', 'v1.5.2', '2024-01-17 09:30:00'),
(2, 'Flat Thermostat',       'thermostat', 'on',      '192.168.2.13', 'v4.1.0', '2024-01-17 09:45:00'),
-- Home 3 (Patel Residence)
(3, 'Hallway Light',         'light',      'off',     '192.168.3.10', 'v2.0.1', '2024-02-03 10:00:00'),
(3, 'Back Garden Camera',    'camera',     'on',      '192.168.3.11', 'v3.0.1', '2024-02-03 10:15:00'),
(3, 'Upstairs Thermostat',   'thermostat', 'on',      '192.168.3.12', 'v4.2.0', '2024-02-03 10:30:00'),
-- Home 4 (Johnson Cottage)
(4, 'Study Desk Light',      'light',      'on',      '192.168.4.10', 'v2.1.3', '2024-02-16 11:00:00');


-- Insert dummy records into device_schedules
INSERT INTO device_schedules (device_id, start_time, end_time, frequency, status, created_at) VALUES
(1,  '18:00:00', '23:00:00', 'daily',    'active',   '2024-01-15 08:00:00'),  -- Living Room Light at sunset
(6,  '07:00:00', '08:30:00', 'daily',    'active',   '2024-01-15 08:05:00'),  -- Bedroom Light morning
(4,  '06:30:00', '09:00:00', 'weekdays', 'active',   '2024-01-15 08:10:00'),  -- Thermostat weekday morning
(4,  '17:00:00', '22:00:00', 'weekdays', 'active',   '2024-01-15 08:15:00'),  -- Thermostat weekday evening
(5,  '07:30:00', '08:00:00', 'daily',    'active',   '2024-01-15 08:20:00'),  -- Kitchen plug morning
(8,  '19:00:00', '23:30:00', 'daily',    'active',   '2024-01-18 09:00:00'),  -- Lounge light evening
(11, '06:00:00', '08:00:00', 'weekdays', 'active',   '2024-01-18 09:05:00'),  -- Flat thermostat morning
(12, '06:00:00', '22:00:00', 'daily',    'active',   '2024-02-05 10:00:00'),  -- Hallway light overnight
(3,  '22:00:00', '23:59:00', 'daily',    'active',   '2024-01-16 07:00:00'),  -- Front door lock night
(15, '08:00:00', '18:00:00', 'weekdays', 'inactive', '2024-02-18 09:00:00');


-- Insert dummy records into scenes table
INSERT INTO scenes (home_id, scene_name, description, is_active, created_at) VALUES
(1, 'Movie Night',   'Dims living room light, locks front door, sets thermostat to 20C',        0, '2024-01-20 10:00:00'),
(1, 'Good Morning',  'Turns on bedroom and living room lights, sets thermostat to 21C',          0, '2024-01-20 10:05:00'),
(1, 'Away Mode',     'Turns off all lights, locks all doors, enables all cameras',               1, '2024-01-20 10:10:00'),
(1, 'Good Night',    'Turns off all lights, locks front door, sets thermostat to 17C',           0, '2024-01-20 10:15:00'),
(2, 'Lounge Relax',  'Dims lounge light and adjusts flat thermostat to 19C',                     0, '2024-01-22 11:00:00'),
(2, 'Secure Flat',   'Locks smart door lock and enables doorbell camera',                        0, '2024-01-22 11:05:00'),
(3, 'Evening Mode',  'Turns on hallway light and enables back garden camera',                    1, '2024-02-10 09:00:00'),
(4, 'Work Mode',     'Turns on study desk light and sets thermostat',                            0, '2024-02-20 14:00:00');

-- Insert dummy records into scene_devices table
INSERT INTO scene_devices (scene_id, device_id, target_status) VALUES
-- Movie Night (scene 1) controls 3 devices
(1, 1, 'on'),   -- Living Room Light ON
(1, 3, 'on'),   -- Front Door Lock ON (locked)
(1, 4, 'on'),   -- Main Thermostat ON
-- Good Morning (scene 2) controls 3 devices
(2, 1, 'on'),   -- Living Room Light ON
(2, 6, 'on'),   -- Bedroom Light ON
(2, 4, 'on'),   -- Main Thermostat ON
-- Away Mode (scene 3) controls 4 devices
(3, 1, 'off'),  -- Living Room Light OFF
(3, 6, 'off'),  -- Bedroom Light OFF
(3, 2, 'on'),   -- Front Door Camera ON
(3, 3, 'on'),   -- Front Door Lock ON
-- Good Night (scene 4) controls 4 devices
(4, 1, 'off'),  -- Living Room Light OFF
(4, 6, 'off'),  -- Bedroom Light OFF
(4, 3, 'on'),   -- Front Door Lock ON
(4, 4, 'on'),   -- Main Thermostat ON
-- Lounge Relax (scene 5)
(5, 8,  'on'),  -- Lounge Light ON
(5, 11, 'on'),  -- Flat Thermostat ON
-- Secure Flat (scene 6)
(6, 9,  'on'),  -- Doorbell Camera ON
(6, 10, 'on'),  -- Smart Door Lock ON
-- Evening Mode (scene 7)
(7, 12, 'on'),  -- Hallway Light ON
(7, 13, 'on'),  -- Back Garden Camera ON
-- Work Mode (scene 8)
(8, 15, 'on');

-- Insert dummy records into notifications table
INSERT INTO notifications (user_id, device_id, message, notification_type, is_read, created_at) VALUES
(1, 2,  'Motion detected at Front Door Camera',                 'security',    0, NOW() - INTERVAL 2 HOUR),
(1, 3,  'Front Door Lock has been unlocked remotely',           'info',        1, NOW() - INTERVAL 5 HOUR),
(1, 4,  'Main Thermostat adjusted to 22 degrees',               'info',        1, NOW() - INTERVAL 1 DAY),
(1, 7,  'Motion detected by Garden Sensor',                     'security',    0, NOW() - INTERVAL 30 MINUTE),
(2, 9,  'Visitor detected at Doorbell Camera',                  'security',    0, NOW() - INTERVAL 1 HOUR),
(2, 11, 'Flat Thermostat malfunction detected',                 'malfunction', 0, NOW() - INTERVAL 3 HOUR),
(3, 13, 'Back Garden Camera detected movement',                 'security',    1, NOW() - INTERVAL 2 DAY),
(1, 5,  'Kitchen Smart Plug schedule completed successfully',   'schedule',    1, NOW() - INTERVAL 1 DAY),
(1, 1,  'Living Room Light turned on by schedule',              'schedule',    1, NOW() - INTERVAL 12 HOUR),
(2, 8,  'Lounge Light turned on by evening schedule',           'schedule',    1, NOW() - INTERVAL 4 HOUR),
(4, 15, 'Study Desk Light turned on',                           'info',        0, NOW() - INTERVAL 6 HOUR),
(1, 2,  'Security breach detected at Front Door',               'security',    0, NOW() - INTERVAL 10 MINUTE);

-- Insert dummy records into userroles
INSERT INTO userroles (user_id, home_id, role_type, access_level, assigned_at) VALUES
(1, 1, 'admin',   'full',       '2024-01-10 09:30:00'),  -- James admin own home
(1, 5, 'admin',   'full',       '2024-03-05 15:00:00'),  -- James admin holiday home
(2, 2, 'admin',   'full',       '2024-01-15 11:00:00'),  -- Sarah admin own flat
(3, 3, 'admin',   'full',       '2024-02-01 09:15:00'),  -- Michael admin own home
(4, 4, 'admin',   'full',       '2024-02-14 12:00:00'),  -- Emily admin own cottage
(5, 1, 'guest',   'limited',    '2024-02-01 10:00:00'),  -- David guest at James home
(2, 1, 'viewer',  'read-only',  '2024-02-10 11:00:00'),  -- Sarah viewer at James home
(5, 2, 'guest',   'limited',    '2024-02-15 09:00:00'),  -- David guest at Sarah flat
(3, 4, 'viewer',  'read-only',  '2024-03-01 14:00:00');  -- Michael viewer at Emily cottage

-- Insert dummy records into devices_logs table
INSERT INTO device_logs (device_id, user_id, old_status, new_status, change_source, changed_at) VALUES
(1,    1,    'off', 'on',      'schedule', NOW() - INTERVAL 8 HOUR),
(1,    1,    'on',  'off',     'manual',   NOW() - INTERVAL 4 HOUR),
(2,    1,    'off', 'on',      'manual',   NOW() - INTERVAL 6 HOUR),
(3,    1,    'on',  'off',     'scene',    NOW() - INTERVAL 3 HOUR),
(4,    1,    'off', 'on',      'schedule', NOW() - INTERVAL 10 HOUR),
(4,    1,    'on',  'standby', 'system',   NOW() - INTERVAL 2 HOUR),
(5,    2,    'off', 'on',      'manual',   NOW() - INTERVAL 5 HOUR),
(6,    2,    'on',  'off',     'scene',    NOW() - INTERVAL 1 HOUR),
(8,    NULL, 'off', 'on',      'schedule', NOW() - INTERVAL 7 HOUR),
(11,   NULL, 'on',  'standby', 'system',   NOW() - INTERVAL 30 MINUTE);
 
 
 
 -- View 1: all_home_devices: Can access devices installed in home
 CREATE VIEW `all_home_devices` AS
SELECT
    h.home_id,
    h.home_name,
    h.address,
    CONCAT(u.first_name, ' ', u.last_name) AS owner_name,
    d.device_id,
    d.device_name,
    d.device_type,
    d.status,
    d.ip_address,
    d.firmware_ver
FROM homes h
JOIN users   u ON u.user_id  = h.user_id
JOIN devices d ON d.home_id  = h.home_id
ORDER BY h.home_name, d.device_type;

-- View 2: Unseen Notification View: Notification messages which is not read by the users
CREATE VIEW vw_unread_notifications AS
SELECT
    n.notification_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email,
    d.device_name,
    d.device_type,
    h.home_name,
    n.message,
    n.notification_type,
    n.created_at
FROM notifications n
JOIN users   u ON u.user_id   = n.user_id
JOIN devices d ON d.device_id = n.device_id
JOIN homes   h ON h.home_id   = d.home_id
WHERE n.is_read = 0
ORDER BY n.created_at DESC;

-- View 3: Active Shedules View - can shows all running schedules
CREATE VIEW vw_active_schedules AS
SELECT
    ds.schedule_id,
    d.device_name,
    d.device_type,
    d.status AS current_status,
    ds.start_time,
    ds.end_time,
    ds.frequency,
    h.home_name
FROM device_schedules ds
JOIN devices d ON d.device_id = ds.device_id
JOIN homes   h ON h.home_id   = d.home_id
WHERE ds.status = 'active'
ORDER BY ds.start_time;

-- View 4: Scene manager shows scene and devices they have control
CREATE VIEW vw_scenes_with_devices AS
SELECT
    s.scene_id,
    s.scene_name,
    s.description,
    s.is_active,
    h.home_name,
    d.device_name,
    d.device_type,
    sd.target_status
FROM scenes s
JOIN homes        h  ON h.home_id  = s.home_id
JOIN scene_devices sd ON sd.scene_id = s.scene_id
JOIN devices       d  ON d.device_id = sd.device_id
ORDER BY s.scene_name, d.device_name;


-- View 5: User access and their roles per home
CREATE VIEW vw_user_roles_access AS
SELECT
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email,
    h.home_name,
    ur.role_type,
    ur.access_level,
    ur.assigned_at
FROM userroles ur
JOIN users u ON u.user_id = ur.user_id
JOIN homes h ON h.home_id = ur.home_id
ORDER BY h.home_name, ur.role_type;

-- View 6: Security alerts and notifications
CREATE VIEW vw_security_alerts AS
SELECT
    n.notification_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    h.home_name,
    d.device_name,
    d.device_type,
    n.message,
    n.is_read,
    n.created_at
FROM notifications n
JOIN users   u ON u.user_id   = n.user_id
JOIN devices d ON d.device_id = n.device_id
JOIN homes   h ON h.home_id   = d.home_id
WHERE n.notification_type = 'security'
ORDER BY n.created_at DESC;

--------------------------------------------------------- 
---------------------------------------------------------
--
-- Query 1: Show all devices in specific home
--
--
---------------------------------------------------------
SELECT
    d.device_id,
    d.device_name,
    d.device_type,
    d.status,
    d.ip_address,
    d.firmware_ver
FROM devices d
WHERE d.home_id = 1
ORDER BY d.device_type, d.device_name;

-- Query 2: Show all devices currently in active state in any particular home
SELECT
    d.device_name,
    d.device_type,
    d.status,
    h.home_name
FROM devices d
JOIN homes h ON h.home_id = d.home_id
WHERE d.home_id = 1
  AND d.status = 'on'
ORDER BY d.device_type;

-- Query 3: Show all unread notification by any specific user
SELECT
    n.notification_id,
    d.device_name,
    n.message,
    n.notification_type,
    n.created_at
FROM notifications n
JOIN devices d ON d.device_id = n.device_id
WHERE n.user_id = 1
  AND n.is_read = 0
ORDER BY n.created_at DESC;

-- Query 4: Show all active schedules for any specific home
SELECT
    ds.schedule_id,
    d.device_name,
    d.device_type,
    ds.start_time,
    ds.end_time,
    ds.frequency
FROM device_schedules ds
JOIN devices d ON d.device_id = ds.device_id
WHERE d.home_id = 1
  AND ds.status = 'active'
ORDER BY ds.start_time;

-- Query 5: All schedules for specific device
SELECT
    ds.schedule_id,
    ds.start_time,
    ds.end_time,
    ds.frequency,
    ds.status
FROM device_schedules ds
WHERE ds.device_id = 4
ORDER BY ds.start_time;

-- Query 6: Show all scene for a home with device count
SELECT
    s.scene_id,
    s.scene_name,
    s.description,
    s.is_active,
    COUNT(sd.device_id) AS devices_controlled
FROM scenes s
LEFT JOIN scene_devices sd ON sd.scene_id = s.scene_id
WHERE s.home_id = 1
GROUP BY s.scene_id
ORDER BY s.scene_name;

-- Query 7: Show all devices controlled by scene 
SELECT
    s.scene_name,
    s.description,
    d.device_name,
    d.device_type,
    sd.target_status
FROM scenes s
JOIN scene_devices sd ON sd.scene_id  = s.scene_id
JOIN devices       d  ON d.device_id  = sd.device_id
WHERE s.scene_id = 1
ORDER BY d.device_type;

-- Query 8: Activate scene 
-- Step 1: Deactivate all scenes in the home first
UPDATE scenes
SET is_active = 0
WHERE home_id = 1;

-- Step 2: Activate the selected scene
UPDATE scenes
SET is_active = 1
WHERE scene_id = 3
  AND home_id = 1;

-- Step 3: Apply target status to all devices in the scene
UPDATE devices d
JOIN scene_devices sd ON sd.device_id = d.device_id
SET d.status = sd.target_status
WHERE sd.scene_id = 3;

--  Query 9: Show all users and their roles per home
SELECT
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email,
    h.home_name,
    ur.role_type,
    ur.access_level,
    ur.assigned_at
FROM userroles ur
JOIN users u ON u.user_id = ur.user_id
JOIN homes h ON h.home_id = ur.home_id
ORDER BY h.home_name, ur.role_type;

-- Query: 10 Show All admin users
SELECT
    CONCAT(u.first_name, ' ', u.last_name) AS admin_name,
    u.email,
    h.home_name,
    ur.access_level,
    ur.assigned_at
FROM userroles ur
JOIN users u ON u.user_id = ur.user_id
JOIN homes h ON h.home_id = ur.home_id
WHERE ur.role_type = 'admin'
ORDER BY h.home_name;

-- Query 11: Show last 24 hours security notifications
SELECT
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    h.home_name,
    d.device_name,
    n.message,
    n.is_read,
    n.created_at
FROM notifications n
JOIN users   u ON u.user_id   = n.user_id
JOIN devices d ON d.device_id = n.device_id
JOIN homes   h ON h.home_id   = d.home_id
WHERE n.notification_type = 'security'
  AND n.created_at >= NOW() - INTERVAL 24 HOUR
ORDER BY n.created_at DESC;

-- Query  12: Count devices by type for any specific home
SELECT
    d.device_type,
    COUNT(d.device_id)       AS total_devices,
    SUM(d.status = 'on')     AS devices_on,
    SUM(d.status = 'off')    AS devices_off,
    SUM(d.status = 'standby')AS devices_standby
FROM devices d
WHERE d.home_id = 1
GROUP BY d.device_type
ORDER BY total_devices DESC;

-- Query 13: Show notification summary per user
SELECT
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    COUNT(n.notification_id)  AS total_notifications,
    SUM(n.is_read = 1)        AS read_count,
    SUM(n.is_read = 0)        AS unread_count
FROM users u
LEFT JOIN notifications n ON n.user_id = u.user_id
GROUP BY u.user_id
ORDER BY unread_count DESC;

-- Query 14: Show device audit log details for last 7 days
SELECT
    dl.log_id,
    d.device_name,
    d.device_type,
    h.home_name,
    CONCAT(u.first_name, ' ', u.last_name) AS changed_by,
    dl.old_status,
    dl.new_status,
    dl.change_source,
    dl.changed_at
FROM device_logs dl
JOIN devices d ON d.device_id  = dl.device_id
JOIN homes   h ON h.home_id    = d.home_id
LEFT JOIN users u ON u.user_id = dl.user_id
WHERE dl.changed_at >= NOW() - INTERVAL 7 DAY
ORDER BY dl.changed_at DESC;

-- Query 15: Show homes with devices and active/inactive status
SELECT
    h.home_name,
    CONCAT(u.first_name, ' ', u.last_name) AS owner_name,
    COUNT(d.device_id)    AS total_devices,
    SUM(d.status = 'on')  AS active_devices,
    SUM(d.status = 'off') AS inactive_devices
FROM homes h
JOIN users   u ON u.user_id = h.user_id
JOIN devices d ON d.home_id = h.home_id
GROUP BY h.home_id
ORDER BY total_devices DESC;

-- Verify number of inserted records

SELECT 'users' AS table_name, COUNT(*) AS record_count 
FROM users
UNION ALL
SELECT 'homes', COUNT(*) FROM homes
UNION ALL
SELECT 'devices', COUNT(*) FROM devices
UNION ALL
SELECT 'device_schedules', COUNT(*) FROM device_schedules
UNION ALL
SELECT 'scenes', COUNT(*) FROM scenes
UNION ALL
SELECT 'scene_devices', COUNT(*) FROM scene_devices
UNION ALL
SELECT 'notifications', COUNT(*) FROM notifications
UNION ALL
SELECT 'userroles', COUNT(*) FROM userroles
UNION ALL
SELECT 'device_logs', COUNT(*) FROM device_logs;
 
SELECT user, host FROM mysql.user
WHERE user LIKE 'smarthome%';
 
SHOW GRANTS FOR 'smarthome_app'@'localhost';
SHOW GRANTS FOR 'smarthome_readonly'@'localhost';
SHOW GRANTS FOR 'smarthome_audit'@'localhost';

CREATE USER 'smarthome_admin'@'localhost'   IDENTIFIED BY 'Adm!nStr0ng#2024';
CREATE USER 'smarthome_app'@'localhost'     IDENTIFIED BY 'App$ecure#2024';
CREATE USER 'smarthome_readonly'@'localhost' IDENTIFIED BY 'R3adOnly#2024';
CREATE USER 'smarthome_audit'@'localhost'   IDENTIFIED BY 'Aud!t$ecure#2024';

 