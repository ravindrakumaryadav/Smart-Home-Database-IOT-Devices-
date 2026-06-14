# 🏠 Smart Home Database — IoT Devices Management System

A fully normalised **MySQL 8.0** relational database designed for a Smart Home IoT platform, supporting multi-home device management, automation scheduling, scenes, real-time notifications, role-based access control, and full audit logging.

> 📘 Developed as part of **CMP7245 – Database Design and Development**, Birmingham City University.

---

## 📌 Project Overview

This project covers the **end-to-end design and implementation** of a relational database for a Smart Home Platform — from requirements analysis and ERD design, through normalisation (1NF–3NF), to physical implementation, sample data population, views, queries, and a complete security model.

The platform models real-world smart home scenarios:
- Users owning and managing **multiple homes**
- **Devices** (lights, cameras, locks, thermostats, sensors, appliances) with live status tracking
- **Schedules** for automated device control
- **Scenes** (e.g. "Movie Night", "Away Mode") controlling multiple devices at once
- **Notifications** for security, malfunctions, and system events
- **Role-based access control** across homes (admin/guest/viewer)
- **Full audit trail** of every device state change

---

## 🗂️ Database Schema

| Table | Description |
|---|---|
| `Users` | Registered platform users (bcrypt-hashed passwords) |
| `Homes` | Homes owned by users, with Wi-Fi credentials |
| `Devices` | Smart devices per home (type, status, firmware, IP) |
| `Schedules` | Automation rules per device |
| `Scenes` | Multi-device configurations per home |
| `Scene_Devices` | Junction table: scenes ↔ devices (many-to-many) |
| `Notifications` | User alerts (security, schedule, malfunction, info) |
| `UserRoles` | User access roles per home |
| `Device_Logs` | Full audit trail of device state changes |

**Design principles applied:**
- ✅ Fully normalised to **3NF** — no redundancy, no transitive dependencies
- ✅ Enforced **referential integrity** via foreign keys with `ON DELETE CASCADE`
- ✅ Domain integrity via `ENUM` types and `CHECK` constraints
- ✅ `utf8mb4` charset for full Unicode/emoji support in notifications

---

## 🔍 Views

Six views support common application and analytics use cases:

| View | Purpose |
|---|---|
| `vw_home_devices` | Device dashboard per home |
| `vw_unread_notifications` | Notification badge / unread alerts |
| `vw_active_schedules` | Automation manager screen |
| `vw_user_access` | Admin user management |
| `vw_security_alerts` | Security dashboard (last 24h) |
| `vw_device_activity_summary` | Device analytics & reporting |

---

## ⚡ Example Queries

- All devices & status for a home
- Unread security notifications per user
- Homes ranked by device count & active devices
- 7-day device audit log
- Devices with repeated malfunctions

---

## 🔐 Security Model

Implements **principle of least privilege** with four dedicated MySQL roles:

| DB User | Role | Access |
|---|---|---|
| `smarthome_admin` | DBA | Full privileges (localhost only) |
| `smarthome_app` | Application server | CRUD on operational tables, insert-only on `Device_Logs` |
| `smarthome_readonly` | Reporting/Dashboard | Read-only on all tables/views |
| `smarthome_audit` | Compliance | Read-only on `Device_Logs` & `Notifications` only |

**Additional safeguards:**
- 🔒 Device state changes routed through `sp_toggle_device` — a stored procedure that atomically updates device status **and** writes an audit log entry within a transaction
- 🚨 `trg_malfunction_alert` trigger auto-generates notifications when a device unexpectedly enters `standby`
- 🔑 Passwords hashed with bcrypt; Wi-Fi credentials encrypted at application layer

---

## 🛠️ Tech Stack

- **Database:** MySQL 8.0 (InnoDB)
- **Design Tool:** MySQL Workbench (EER Diagram)
- **Concepts:** ERD modelling, normalisation, ACID transactions, stored procedures, triggers, views, RBAC

---

## 📁 Repository Contents

- `smart_home_db_EER_mwb.bak` — MySQL Workbench EER diagram model
- SQL script — full schema, sample data, views, procedures, and triggers
- Technical report — critical evaluation, design rationale, and security analysis

---

## 🚀 Setup

```bash
# 1. Open the EER model in MySQL Workbench
#    File > Open Model > smart_home_db_EER_mwb.bak

# 2. Forward-engineer to create the schema, or run the SQL script directly
mysql -u root -p < smart_home_db.sql

# 3. Verify
USE smart_home_db;
SHOW TABLES;
```

---

## 📄 License

This project was developed for academic purposes (CMP7245, Birmingham City University).
