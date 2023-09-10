# **Relational Database**

### **Ahmad Faisal Fahmi, Software dan Data Engineering Pacmann Batch 3**

## 1. **Latar Belakang Masalah**

Membuat database untuk sebuah project atau aplikasi dan memahami proses retrieval data adalah salah satu tugas dari Software & Data Engineering.

Dalam project ini anda diberikan tugas untuk membangun relational database untuk sebuah website yang menawarkan penjualan mobil bekas. Gambaran umum tentang project ini adalah siapa saja dapat menawarkan produknya (mobil bekas) dalam bentuk iklan dan calon pembeli dapat melakukan pencarian berdasarkan beberapa kategori. Untuk lebih jelasnya, berikut adalah fitur serta batasan project ini:

1. Setiap user aplikasi dapat menawarkan lebih dari satu produk mobil bekasnya.
2. Sebelum menjual produk mobil, user harus melengkapi data dirinya terlebih dahulu, seperti nama, kontak, dan domisili lokasi.
3. User menawarkan produknya melalui iklan yang akan ditampilkan oleh website.
4. Iklan ini berisikan judul, detail informasi produk yang ditawarkan, serta kontak penjual.
5. Beberapa informasi yang harus ditulis dalam iklan adalah sebagai berikut
merek mobil: Toyota, Daihatsu, Honda, dll
Model: Toyota Camry, Toyota Corolla Altis, Toyota Vios,Toyota Camry Hybrid, dll
Jenis body mobil: MPV, SUV, Van, Sedan, Hatchback, dll
Tipe mobil: manual atau automatic
Tahun pembuatan mobil: 2005, 2010, 2011, 2020 
Deskripsi lain, seperti warna, jarak yang telah ditempuh, dsb,  boleh ditambahkan sesuai kebutuhan.
6. Setiap user bisa mencari mobil yg ditawarkan berdasarkan lokasi user penjual, merk mobil, dan jenis body mobil.
7. Jika calon pembeli tertarik terhadap sebuah mobil, ia dapat menawar (bid) harga produk jika penjual mengizinkan fitur tawar.
8. Transaksi pembelian dilakukan di luar aplikasi sehingga tidak dalam scope project

## 2. **Designing Database**

![ERD](https://github.com/scofieId16/Relational-Database-Pacmann/blob/4803d18124c3bf863602a84f6a671d2bb6dd8cf7/ERD/ERD.png)

```
-- Create SEQUENCE for bid table
CREATE SEQUENCE bid_bid_id_seq;

-- Create SEQUENCE for car table
CREATE SEQUENCE car_car_id_seq;

-- Create SEQUENCE for advertisement table
CREATE SEQUENCE advertisement_ad_id_seq;

-- Create SEQUENCE for user_account table
CREATE SEQUENCE user_account_user_id_seq;

-- Create SEQUENCE for location table
CREATE SEQUENCE location_location_id_seq;

CREATE TABLE IF NOT EXISTS public.bid
(
    bid_id integer NOT NULL DEFAULT nextval('bid_bid_id_seq'::regclass),
    ad_id integer NOT NULL,
    bidder_id integer NOT NULL,
    date_bid date NOT NULL,
    bid_price integer NOT NULL,
    bid_status character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT bid_pkey PRIMARY KEY (bid_id)
);

CREATE TABLE IF NOT EXISTS public.car
(
    car_id integer NOT NULL DEFAULT nextval('car_car_id_seq'::regclass),
    brand character varying(100) COLLATE pg_catalog."default" NOT NULL,
    model character varying(255) COLLATE pg_catalog."default" NOT NULL,
    body_type character varying(25) COLLATE pg_catalog."default" NOT NULL,
    year integer NOT NULL,
    price integer NOT NULL,
    CONSTRAINT car_id PRIMARY KEY (car_id)
);

CREATE TABLE IF NOT EXISTS public.advertisement
(
    ad_id integer NOT NULL DEFAULT nextval('advertisement_ad_id_seq'::regclass),
    car_id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    date_post date,
    CONSTRAINT advertisement_pkey PRIMARY KEY (ad_id)
);

CREATE TABLE IF NOT EXISTS public.user_account
(
    user_id integer NOT NULL DEFAULT nextval('user_account_user_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    contact character varying(15) COLLATE pg_catalog."default" NOT NULL,
    location_id integer NOT NULL,
    CONSTRAINT user_account_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.location
(
    location_id integer NOT NULL DEFAULT nextval('location_location_id_seq'::regclass),
    city_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    CONSTRAINT location_pkey PRIMARY KEY (location_id)
);

ALTER TABLE IF EXISTS public.bid
    ADD CONSTRAINT ad_id FOREIGN KEY (ad_id)
    REFERENCES public.advertisement (ad_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.advertisement
    ADD CONSTRAINT advertisement_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.user_account (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.advertisement
    ADD CONSTRAINT car_id FOREIGN KEY (car_id)
    REFERENCES public.car (car_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.user_account
    ADD CONSTRAINT location_id FOREIGN KEY (location_id)
    REFERENCES public.location (location_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
```

## 3. **Populating The Database**

```python
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
```

