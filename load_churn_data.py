import pandas as pd
import sqlite3

# Step 1: Load Excel file
df = pd.read_excel("02 Customer Churn-Dataset.xlsx", sheet_name="01 Churn-Dataset")

# Step 2: Connect to SQLite (creates a file-based DB)
conn = sqlite3.connect("churn_data.db")

# Step 3: Send the data into SQL
df.to_sql("churn", conn, if_exists="replace", index=False)

print("Data loaded into SQL successfully!")
