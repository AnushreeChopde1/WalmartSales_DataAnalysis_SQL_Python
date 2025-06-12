# 🛒 Walmart Sales Data Analysis | End-to-End Project using SQL & Python

This repository showcases a complete data analytics project focused on Walmart sales data. The goal was to clean, transform, and analyze transactional data to extract actionable business insights. Used **Python** (Visual Studio Code) for data preprocessing and feature engineering, and **SQL** (MySQL Workbench) for querying and solving business problems. The project also involves working with **relational databases (MySQL)** to simulate real-world enterprise environments.

---

## 📌 Objectives

- Explore and clean real-world sales data
- Perform feature engineering to enhance data usability
- Load the transformed data into SQL databases
- Answer key business questions using complex SQL queries
- Document the process with clean, reproducible code

---

## ⚙️ Tools & Technologies

- **Python**: pandas, numpy, sqlalchemy, connectors
- **SQL**: MySQL for querying and data storage
- **VS Code**: Development environment
- **Kaggle API**: For dataset access

---

## 🔄 Project Workflow

1. **Environment Setup**
   - Structured local folders for data, scripts, and notebooks
   - Installed required libraries listed in `requirements.txt`

2. **Data Access**
   - Downloaded Walmart sales dataset using Kaggle API
   - Saved raw data in a dedicated `/data` folder

3. **Data Cleaning with Python**
   - Removed duplicates, handled missing values
   - Standardized data types and formatting (e.g., date, currency)
   - Created calculated columns such as `total_sales`
   - These are the essential Python libraries used for data cleaning, database connection, and basic analysis:
       - pandas
       - numpy
       - sqlalchemy
       - mysql-connector-python
       - psycopg2

4. **Data Upload to SQL Databases**
   - Connected to both MySQL via SQLAlchemy
   - Programmatically created and populated tables with cleaned data
   - Used advanced SQL queries to perform business analysis including CTEs, window functions, inner queries and query optimization

5. **SQL Business Analysis**
   - Wrote and documented SQL queries to analyze:
     - 1. Analyze Payment Methods and Sales
          - Question: What are the different payment methods, and how many transactions andi tems were sold with each method?
          - Purpose: This helps understand customer preferences for payment methods, aiding in payment optimization strategies.
     - 2. Identify the Highest-Rated Category in Each Branch
          - Question: Which category received the highest average rating in each branch?
          - Purpose: This allows Walmart to recognize and promote popular categories in specific branches, enhancing customer satisfaction and branch-specific marketing.      
     - 3. Determine the Busiest Day for Each Branch
          - Question: What is the busiest day of the week for each branch based on transaction volume?
          - Purpose: This insight helps
     - 4. Calculate Total Quantity Sold by Payment Method
          - Question: How many items were sold through each payment method?
          - Purpose: This helps Walmart track sales volume by payment type, providing insights into customer purchasing habits.
     - 5. Analyze Category Ratings by City
          - Question: What are the average, minimum, and maximum ratings for each category in each city?
          - Purpose: This data can guide city-level promotions, allowing Walmart to address regional preferences and improve customer experiences.
     - 6. Calculate Total Profit by Category
          - Question: What is the total profit for each category, ranked from highest to lowest?
          - Purpose: Identifying high-profit categories helps focus
     - 7. Determine the Most Common Payment Method per Branch
          - Question: What is the most frequently used payment method in each branch?
          - Purpose: This information aids in understanding branch-specific payment preferences, potentially allowing branches to streamline their payment processing systems.
     - 8. Analyze Sales Shifts Throughout the Day
          - Question: How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?
          - Purpose: This insight helps in managing staff shifts and stock replenishment schedules, especially during high-sales periods.
     - 9. Identify Branches with Highest Revenue Decline Year-Over-Year
          - Question: Which branches experienced the largest decrease in revenue compared to the previous year?
          - Purpose: Detecting branches with declining revenue is crucial for understanding possible local issues and creating strategies to boost sales or mitigate losses.
          
6. **Results Interpretation**  
   - Summarized trends and observations
   - Identified strategic areas of improvement and growth

---

## 🧠 Key Takeaways

- Strengthened my ability to work across multiple environments (Python + SQL)
- Practiced building a mini ETL pipeline and database schema from scratch
- Applied business thinking to technical data problems
- Gained deeper insight into the structure and nuances of retail sales data

---

## 📂 Repository Layout

/data # Raw and cleaned datasets (not shared publicly)
/scripts
├── data_cleaning.py
├── db_loader.py
/sql_queries
├── revenue_by_branch.sql
├── category_performance.sql
/notebooks
├── exploratory_analysis.ipynb
README.md


