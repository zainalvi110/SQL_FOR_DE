
<div align="center">

# 🧠 Ultimate SQL Functions & Joins Practice  
### ✨ One-Stop Hub to Master Core SQL Queries, Functions & Joins

![SQL Practice Banner](https://raw.githubusercontent.com/zainalvi110/SQL_FOR_DE/main/assets/sql-practice-banner.gif)

[![Stars](https://img.shields.io/github/stars/zainalvi110/SQL_FOR_DE?style=flat-square)](https://github.com/zainalvi110/SQL_FOR_DE/stargazers)
[![Forks](https://img.shields.io/github/forks/zainalvi110/SQL_FOR_DE?style=flat-square)](https://github.com/zainalvi110/SQL_FOR_DE/network)
[![License](https://img.shields.io/github/license/zainalvi110/SQL_FOR_DE?style=flat-square)](https://github.com/zainalvi110/SQL_FOR_DE/blob/main/LICENSE)

</div>

---

## 📌 About This Repository

This repository includes a structured SQL script covering:

- ✅ SQL functions
- 🔄 JOINS (Inner, Left, Right, Full)
- 🧪 Query examples
- 📘 Interview-ready logic

Perfect for students, job seekers, and revision warriors 🚀

---

## 💡 What's Inside?

| Category | Covered Concepts |
|----------|------------------|
| 🔍 Selection & Filtering | `SELECT`, `WHERE`, `BETWEEN`, `LIKE`, `IN`, `DISTINCT` |
| 📊 Aggregate Functions | `SUM`, `AVG`, `COUNT`, `MIN`, `MAX` |
| 🔣 String Functions | `SUBSTRING`, `LTRIM`, `CONCAT` |
| 🔗 Joins | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN` |
| 🔠 Sorting & Grouping | `ORDER BY`, `GROUP BY`, `HAVING` |
| 🧱 Table Basics | `CREATE TABLE`, `INSERT INTO` |

---

## 🔗 Join Examples Included

```sql
-- Inner Join Example
SELECT e.e_name, d.d_name
FROM employe e
INNER JOIN department d
ON e.e_dept_id = d.d_id;

-- Left Join Example
SELECT e.e_name, d.d_name
FROM employe e
LEFT JOIN department d
ON e.e_dept_id = d.d_id;
```

---

## 🧠 Other Sample Snippets

```sql
-- Total salary spent on 'Data' department employees
SELECT SUM(e_salary) 
FROM employe 
WHERE e_dept = 'Data';

-- Find employees with age between 25 and 35
SELECT * FROM employe 
WHERE e_age BETWEEN 25 AND 35;

-- Format name with substring
SELECT SUBSTRING(e_name, 1, 3) FROM employe;
```

---

## 📊 Dataset Preview

| e_id | e_name  | e_salary | e_age | e_gender | e_dept   |
|------|---------|----------|-------|----------|----------|
| 12   | ameen   | 55000    | 33    | male     | cleaning |
| 11   | aleena  | 110000   | 29    | Female   | Data     |
| ...  | ...     | ...      | ...   | ...      | ...      |

---

## 🚀 Getting Started

```bash
git clone https://github.com/zainalvi110/SQL_FOR_DE.git
cd SQL_FOR_DE
```

- Open the `.sql` file in your DBMS (DBeaver, SSMS, PgAdmin etc.)
- Execute queries step-by-step and learn as you go

---

## ✨ Why Use This Repo?

- 🔍 Learn how to **combine SQL logic**
- 📚 Great for **quick revision**
- 💼 Ideal for **SQL interviews**
- 🧠 Full of **clean examples**

---

## 📬 Connect with Me

- 📧 Email: zainalvi552@gmail.com  
- 🔗 [LinkedIn](https://www.linkedin.com/in/zain-ul-abideen-alvi-32b3b6275/)  
- 📁 [Portfolio](https://datascienceportfol.io/zainalvi110)

---

## 📄 License

MIT License — use this repo for learning, practicing, and teaching!

---

> ⭐ Found this helpful? Give it a **star** and share with SQL learners!

