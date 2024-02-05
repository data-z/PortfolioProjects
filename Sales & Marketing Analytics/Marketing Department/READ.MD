# Credit Card Customer Segmentation

Marketing is crucial for the growth and sustainability of any business.
Marketers can help build the company’s brand, engage customers, grow revenue, and increase sales.
One of the key pain points for marketers is to know their customers and identify their needs.
By understanding the customer, marketers can launch a targeted marketing campaign that is tailored for specific needs.
If data about the customers is available, data science can be applied to perform market segmentation. 

In this case study, I have been hired as a consultant to a bank in New York City. 
The bank has extensive data on their customers for the past 6 months. 
The marketing team at the bank wants to launch a targeted ad marketing campaign by dividing their customers into at least 3 distinctive groups.

[Click here to go directly to the code in Python Notebook](https://github.com/data-z/PortfolioProjects/blob/212ec2b7c92ae05b8dc445b558f30b0cff671d79/Sales%20%26%20Marketing%20Analytics/Marketing%20Department/Marketing_Department.ipynb)

## The Data

The dataset consist of 18 columns and ~9,000 records. 
See Columns and definitions below:

- CUSTID: Identification of Credit Card holder
- BALANCE: Balance amount left in customer's account to make purchases
- BALANCE_FREQUENCY: How frequently the Balance is updated, score between 0 and 1 (1 = frequently updated, 0 = not frequently updated)
- PURCHASES: Amount of purchases made from account
- ONEOFFPURCHASES: Maximum purchase amount done in one-go
- INSTALLMENTS_PURCHASES: Amount of purchase done in installment
- CASH_ADVANCE: Cash in advance given by the user
- PURCHASES_FREQUENCY: How frequently the Purchases are being made, score between 0 and 1 (1 = frequently purchased, 0 = not frequently purchased)
- ONEOFF_PURCHASES_FREQUENCY: How frequently Purchases are happening in one-go (1 = frequently purchased, 0 = not frequently purchased)
- PURCHASES_INSTALLMENTS_FREQUENCY: How frequently purchases in installments are being done (1 = frequently done, 0 = not frequently done)
- CASH_ADVANCE_FREQUENCY: How frequently the cash in advance being paid
- CASH_ADVANCE_TRX: Number of Transactions made with "Cash in Advance"
- PURCHASES_TRX: Number of purchase transactions made
- CREDIT_LIMIT: Limit of Credit Card for user
- PAYMENTS: Amount of Payment done by user
- MINIMUM_PAYMENTS: Minimum amount of payments made by user
- PRC_FULL_PAYMENT: Percent of full payment paid by user
- TENURE: Tenure of credit card service for user

### General Statistics of Data

- Mean balance is $1564
- Balance frequency is frequently updated on average ~0.9
- Purchases average is $1000
- one off purchase average is ~$600
- Average purchases frequency is around 0.5
- average ONEOFF_PURCHASES_FREQUENCY, PURCHASES_INSTALLMENTS_FREQUENCY, and CASH_ADVANCE_FREQUENCY are generally low
- Average credit limit ~ 4500
- Percent of full payment is 15%
- Average tenure is 11 years

We looked at the customer with the highest One-Off Purchases and found:
- This customer has 101 purchase transactions 
- They have an $11,500 balance
- The customer does not use the cash advance alot but they make frequent purchases
- The customer only pays in full 25% of the time

We looked at the customer with the higest Cash Advances and found:
- This customer made 123 cash advance transactions!!
- They appear to use the cash advance more than purchases for some reason
- Never paid the credit card in full

After exploring the data for missing data we found **1 missing datapoint for Credit_Limit** and **313 missing data points for Minimum_Payment**.
We imputed the missing data points with the mean of each variable. We also drop any duplicate records and dropped the CUST_ID column since it has no meaning.

## Visual Exploratory Data Analysis
The first visual is a DistPlot that combines a Histogram with a Kernel Density Estimate Plot (KDE Plot). 
KDE demonstrates the probability density at different values in a continuous variable.
[You can view all DistPlot Images Here](https://github.com/data-z/PortfolioProjects/tree/4f86588dd9230fd3d9d2ff3680325801ab922737/Sales%20%26%20Marketing%20Analytics/Marketing%20Department/images) 
![Balance DistPlot](images/BALANCE_KDE_histogram.png)

Upon analysis of the plots it was concluded that all the variables were non-normal distributions. 
We also observed some specific information in the data such as:
- Mean of balance is $1500
- 'Balance_Frequency' for most customers is updated frequently ~1
- For 'PURCHASES_FREQUENCY', there are two distinct group of customers
- For 'ONEOFF_PURCHASES_FREQUENCY' and 'PURCHASES_INSTALLMENT_FREQUENCY' most users don't do one off puchases or installment purchases frequently
- Very small number of customers pay their balance in full 'PRC_FULL_PAYMENT'~0
- Credit limit average is around $4500
- Most customers are ~11-12 years tenure






