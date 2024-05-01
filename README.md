### Sales Data Analysis - Walmart

#### Introduction
This project involves the creation and management of a database named `salesDatawalmart` to store sales data from Walmart. The database consists of a table named `sales`, which contains detailed information about each sale transaction, including the invoice ID, branch, city, customer type, gender, product line, unit price, quantity, VAT, total amount, date, time, payment method, cost of goods sold (COGS), gross margin percentage, gross income, and rating.

#### Database Schema
The `sales` table schema includes the following columns:
- `invoice_id`: Unique identifier for each sale transaction
- `branch`: Branch code where the transaction occurred
- `city`: City where the branch is located
- `customer_type`: Type of customer (e.g., Member, Normal)
- `gender`: Gender of the customer
- `product_line`: Line of the product purchased
- `unit_price`: Unit price of the product
- `quantity`: Quantity of the product purchased
- `VAT`: Value-added tax applied to the transaction
- `total`: Total amount of the transaction
- `date`: Date of the transaction
- `time`: Time of the transaction
- `payment_method`: Method used for payment (e.g., Cash, Credit Card)
- `cogs`: Cost of goods sold
- `gross_margin_pct`: Gross margin percentage
- `gross_income`: Gross income generated from the transaction
- `rating`: Customer rating for the transaction

#### Feature Engineering
- **Time of Day**: The time column is used to derive the time of day (Morning, Afternoon, Evening) for each transaction.
- **Day Name**: The date column is used to extract the day name (e.g., Monday, Tuesday) for each transaction.
- **Month Name**: The date column is used to extract the month name (e.g., January, February) for each transaction.

#### Queries
Various queries are executed to analyze the sales data, including:
- Finding unique products, cities, and branches.
- Determining common payment methods and best-selling product lines.
- Calculating total revenue by month.

#### Notes
- Safe updates are disabled using the command `SET SQL_SAFE_UPDATES = 0;` to handle certain queries that may result in errors.

For further analysis and exploration of the sales data, additional queries and data visualization techniques can be implemented.
