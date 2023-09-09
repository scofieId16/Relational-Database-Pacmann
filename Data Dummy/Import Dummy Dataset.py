from dummy1908 import *

# Establish a connection to the PostgreSQL database
connection = psycopg2.connect(
    host="localhost",
    database="projectsql2608",
    user="postgres",
    password="Faisal1679#"
)

dummy_dataset_dict = [
    {
        "filename": "penjual_dummy1908.csv",
        "table_name": "user_account",
        "column_names": ["user_id", "name", "contact", "location_id"]
    },
    {
        "filename": "ads_dummy1908.csv",
        "table_name": "advertisement",
        "column_names": ["ad_id", "car_id", "user_id", "title", "date_post"]
    },
    {
        "filename": "bid_dummy1908.csv",
        "table_name": "bid",
        "column_names": ["bid_id", "ad_id", "bidder_id",
                         "date_bid", "bid_price", "bid_status"]
    }
]

# Generate dummy dataset
generate_dummy_user()
generate_dummy_ads()
generate_dummy_bid()

# Import dummy dataset to database
for i in range(len(dummy_dataset_dict)):
        import_dummy_dataset(connection, dummy_dataset_dict[i]["filename"],
                         dummy_dataset_dict[i]["table_name"], dummy_dataset_dict[i]["column_names"])


# Close the database connection
connection.close()