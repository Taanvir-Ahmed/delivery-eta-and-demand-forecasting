USE order_delivery_project;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET order_time_dt = STR_TO_DATE(
  REPLACE(order_placed_at_utc, 'T', ' '),
  '%Y-%m-%d %H:%i:%s.%f'
);

SET SQL_SAFE_UPDATES = 1;

SELECT order_placed_at_utc, order_time_dt
FROM orders
LIMIT 5;

SELECT
  COUNT(*) AS total,
  SUM(order_time_dt IS NULL) AS dt_nulls
FROM orders;