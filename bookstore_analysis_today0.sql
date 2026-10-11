SELECT USER FROM DUAL;
SELECT table_name
FROM user_tables
WHERE table_name IN (
    'AUTHORS',
    'BOOKS',
    'CUSTOMERS',
    'GENRES',
    'ORDERS',
    'ORDER_DETAILS'
)
ORDER BY table_name;