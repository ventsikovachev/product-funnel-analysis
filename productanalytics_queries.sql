CREATE DATABASE defi_project;
USE defi_project;

CREATE TABLE users (
    user_id INT,
    signup_date VARCHAR(10),
    country VARCHAR(10),
    device VARCHAR(10),
    user_segment VARCHAR(20),
    wallet_connected INT,
    funded INT,
    used_product INT,
    retained INT,
    deposit_amount DECIMAL(10,2)
);

SELECT *
FROM users

SELECT 
  COUNT(*) AS total_users,
  SUM(funded) AS funded_users,
  SUM(used_product) AS used_users,
  SUM(retained) AS retained_users
FROM users;

SELECT 
  country,
  COUNT(*) AS total_users,
  SUM(wallet_connected) AS connected_wallet,
  SUM(funded) AS funded_users,
  SUM(used_product) AS users_used_product,
  SUM(retained) AS retained_users
FROM users
GROUP BY country
ORDER BY total_users DESC;



SELECT 
  COUNT(*) AS total_users,
  SUM(funded)/COUNT(*) AS funded_rate,
  SUM(used_product)/SUM(funded) AS usage_rate,
  SUM(retained)/SUM(used_product) AS retention_rate
FROM users;


SELECT 
  COUNT(*) AS total_users,
  SUM(funded) AS funded_users,
    SUM(funded)/COUNT(*) AS funded_rate,
  SUM(used_product) AS used_users,
  SUM(used_product)/SUM(funded) AS usage_rate,
  SUM(retained) AS retained_users,
  SUM(retained)/SUM(used_product) AS retention_rate
FROM users;


SELECT 
  country,
  COUNT(*) AS total_users,
  SUM(funded)/COUNT(*) AS funded_rate,
  SUM(used_product) AS used_users,
  SUM(used_product)/SUM(funded) AS usage_rate,
  SUM(retained) AS retained_users,
  SUM(retained)/SUM(used_product) AS retention_rate
FROM users
GROUP BY country
ORDER BY funded_rate DESC;

SELECT 
	country,
  AVG(deposit_amount) AS avg_deposit,
  SUM(deposit_amount) AS total_volume
FROM users
GROUP BY country


SELECT 
  AVG(deposit_amount) AS avg_deposit,
  SUM(deposit_amount) AS total_volume
FROM users
WHERE funded = 1;


SELECT 
  device,
  COUNT(*) AS total_users,
  SUM(used_product)/SUM(funded) AS usage_rate
FROM users
GROUP BY device;


SELECT 
  device,
  total_users,
  usage_rate,
  total_users * usage_rate AS engaged
FROM (
  SELECT 
    device,
    COUNT(*) AS total_users,
    SUM(used_product) * 1.0 / SUM(funded) AS usage_rate
  FROM users
  GROUP BY device
) t;

