# 📊 SQL Business Analysis Project — E-commerce (Olist Dataset)

## 📌 Project Overview

This project aims to demonstrate strong **SQL analytics skills** by answering **real business questions** using a Brazilian e-commerce dataset (Olist).
The focus is not on machine learning, but on **business reasoning, clear SQL logic, and decision-oriented metrics**, which are highly valued for **Data Analyst Intern / Junior roles**.

The analysis covers four main business areas:

* **Sales Performance**
* **Growth Analysis**
* **Customer Retention**
* **Funnel Conversion**

All analyses were built using **pure SQL**, following best practices such as:

* clear metric definitions
* layered queries with CTEs
* window functions for time-based analysis
* consistent business logic

---

## 🧩 Dataset

The project uses the **Olist Brazilian E-commerce Dataset**, which contains real marketplace data, including:

* orders
* customers
* products
* payments
* order items

This dataset is widely used in analytical case studies and reflects real-world e-commerce complexity.

---

## 🛠️ Tools & Skills Used

* SQL (PostgreSQL syntax)
* Common Table Expressions (CTEs)
* Window Functions (`LAG`, `ROW_NUMBER`)
* Time-series analysis (`date_trunc`)
* Business metrics design
* Data cleaning through business rules

---

## 📊 Analysis Structure

### 1️⃣ Sales Performance

Key questions answered:

* What is the total revenue generated?
* What is the average order value (AOV)?
* How many orders were placed in total?
* Which products generate the highest revenue?
* Which product categories generate the most revenue?

📌 **Key Insight**
Revenue is highly concentrated in a few product categories, indicating strong dependence on specific segments.

---

### 2️⃣ Growth Analysis

Key questions answered:

* How has monthly revenue evolved over time?
* What is the month-over-month (MoM) revenue growth?
* How does revenue behave year-over-year (YoY)?
* How many unique customers purchase per month on average?

📌 **Key Insight**
Revenue growth shows volatility over time, highlighting the importance of seasonality and customer acquisition consistency.

---

### 3️⃣ Customer Retention

Key questions answered:

* How many unique customers made at least one purchase?
* What percentage of customers make only one purchase?
* What percentage of customers are recurring customers?
* What is the average time between first and second purchase?

📌 **Key Insights**

* **96.9% of customers make only one purchase**, indicating very low retention.
* Only **3.1% of customers are recurring**, representing a strong opportunity for loyalty and re-engagement strategies.
* Among recurring customers, the **average time between first and second purchase is ~81 days**, suggesting a long repurchase cycle.

---

### 4️⃣ Funnel Analysis

Key questions answered:

* How many orders were created?
* How many orders were successfully paid?
* What is the conversion rate from order creation to payment?

📌 **Key Insight**
The conversion rate from order creation to payment is very high, suggesting that **payment is not a major friction point** in the customer journey.

---

## 📂 Project Structure

```
/sql
  01_sales_performance.sql
  02_growth.sql
  03_retention.sql
  04_funnel.sql

README.md
```

Each SQL file contains:

* clearly written business questions as comments
* clean, well-structured queries
* consistent business logic across analyses

---

## 🧠 Key Learnings

Through this project, I strengthened my ability to:

* translate business questions into SQL logic
* work with time-based data and growth metrics
* analyze customer behavior and retention
* design clear, explainable analytical pipelines

This project reflects how SQL is used in real analytics roles: **to answer business questions clearly and reliably**.

---

## 🚀 Next Steps

Potential extensions of this project include:

* cohort analysis
* customer lifetime value estimation
* visualization dashboards (Power BI / Tableau)

---

## 📬 Contact

If you would like to discuss this project or provide feedback:

* LinkedIn: *(add your profile link here)*
* GitHub: *(this repository)*

---

⭐ *Thank you for reading!*
