COPY
location
FROM 'E:\SEM 8\Work\Data Engineer\Pacmann SDE\SQL and Relational Database\Relational Database Pacmann -- Ahmad_Faisal_Fahmi\Data Dummy\city.csv' 
DELIMITER ',' 
CSV 
HEADER;

COPY 
user_account
FROM 'E:\SEM 8\Work\Data Engineer\Pacmann SDE\SQL and Relational Database\Relational Database Pacmann -- Ahmad_Faisal_Fahmi\Data Dummy\dummy_penjual.csv' 
DELIMITER ',' 
CSV 
HEADER;

COPY 
car
FROM 'E:\SEM 8\Work\Data Engineer\Pacmann SDE\SQL and Relational Database\Relational Database Pacmann -- Ahmad_Faisal_Fahmi\Data Dummy\car_product.csv' 
DELIMITER ',' 
CSV 
HEADER;

COPY 
advertisement
FROM 'E:\SEM 8\Work\Data Engineer\Pacmann SDE\SQL and Relational Database\Relational Database Pacmann -- Ahmad_Faisal_Fahmi\Data Dummy\dummy_ads.csv' 
DELIMITER ',' 
CSV 
HEADER;

COPY 
bid
FROM 'E:\SEM 8\Work\Data Engineer\Pacmann SDE\SQL and Relational Database\Relational Database Pacmann -- Ahmad_Faisal_Fahmi\Data Dummy\dummy_bid.csv' 
DELIMITER ',' 
CSV 
HEADER;