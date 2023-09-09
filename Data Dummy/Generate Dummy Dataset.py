import random
import csv
import psycopg2
import pandas as pd
from psycopg2 import sql
from faker import Faker

# Instantiate Faker object
fake = Faker('id_ID')


def generate_dummy_user():
    # Generate dummy data
    num_records = 100  # Number of records to generate
    header = ['seller_id', 'name', 'contact', 'kota_id']
    data = []

    phone_numbers = [f"+62{random.randint(80000000000, 89999999999)}" for _ in range(num_records)]

    # Read city data from city.csv
    with open('E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/city.csv', 'r') as city_file:
        city_reader = csv.DictReader(city_file)
        cities = list(city_reader)

        # Generate dummy data with location_id from city data
        for i in range(num_records):
            city = random.choice(cities)
            kota_id = city['kota_id']
            data.append([i+1, fake.name(), phone_numbers[i], kota_id])

    # Convert data list to DataFrame
    table = pd.DataFrame(data, columns=header)

    # Export data to CSV file
    filename = 'E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/penjual_dummy1908.csv'
    table.to_csv(filename, index=False)

    print(f"Dummy dataset created and exported as {filename}")


def generate_dummy_ads():
    # Read car_product.csv
    car_data = []
    with open('E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/car_product.csv', 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            car_data.append(row)

    # Read user_dummy_dataset.csv
    user_data = []
    with open('E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/penjual_dummy1908.csv', 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            user_data.append(row)

    # Generate dummy dataset
    header = ['ad_id', 'car_id', 'seller_id', 'title', 'date_post']
    data = []
    for i in range(1, 101):  # Generate 100 records
        ad_id = i
        car_id = random.randint(1, 50)
        seller_id = random.choice(user_data)['seller_id']
        title = f"Dijual {car_data[car_id - 1]['model']} body {car_data[car_id - 1]['body_type']} tahun {car_data[car_id - 1]['year']}"
        date_post = fake.date_between(start_date='-1y', end_date='today')
        data.append([ad_id, car_id, seller_id, title, date_post])

    # Convert data list to DataFrame
    table = pd.DataFrame(data, columns=header)

    # Export data to CSV file
    filename = 'E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/ads_dummy1908.csv'
    table.to_csv(filename, index=False)

    print(f"Dummy dataset created and exported as {filename}")


def generate_dummy_bid():
    # Read car_product.csv
    car_data = []
    with open('E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/car_product.csv', 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            car_data.append(row)

    # Read user_dummy_dataset.csv
    user_data = []
    with open('E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/penjual_dummy1908.csv', 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            user_data.append(row)
    
    # Read ads_dummy_dataset.csv
    ads_data = []
    with open('E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/ads_dummy1908.csv', 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            ads_data.append(row)

    # Generate dummy dataset
    header = ['bid_id', 'ad_id', 'id_bidder',
              'date_bid', 'bid_price', 'bid_status']
    data = []
    for i in range(1, 151):  # Generate 150 records
        bid_id = i
        ad_id = random.choice(ads_data)['ad_id']
        id_bidder = random.randint(1, 151)
        date_bid = fake.date_between(start_date='-1y', end_date='today')
        bid_price = random.randint(90_000_000, 500_000_000)
        bid_status = random.choice(['Sent'])
        data.append([bid_id, ad_id, id_bidder, date_bid, bid_price, bid_status])

    # Convert data list to DataFrame
    table = pd.DataFrame(data, columns=header)

    # Export data to CSV file
    filename = 'E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/bid_dummy1908.csv'
    table.to_csv(filename, index=False)

    print(f"Dummy dataset created and exported as {filename}")


def import_dummy_dataset(connection, filename, table_name, column_names):
    path = f'E:/SEM 8/Work/Data Engineer/Pacmann SDE/SQL and Relational Database/Mobil bekas/{filename}'

    with open(path, 'r') as file:
        cursor = connection.cursor()

        # Create the COPY SQL statement
        copy_sql = sql.SQL("COPY {} ({}) FROM STDIN WITH (FORMAT CSV, HEADER)").format(
            sql.Identifier(table_name),
            sql.SQL(', ').join(map(sql.Identifier, column_names))
        )

        # Execute the COPY command
        cursor.copy_expert(copy_sql, file)

        connection.commit()
        cursor.close()

    print(f"{table_name} data imported successfully!")