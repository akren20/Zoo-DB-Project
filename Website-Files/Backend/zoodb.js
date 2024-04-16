import mysql from 'mysql2';

const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'zoodb.cfmqaom2q89a.us-east-2.rds.amazonaws.com',
    user: 'admin',
    password: 'UMADB123',
    database: 'zoodb',
    ssl: {
        rejectUnauthorized: false // Disable SSL verification (not recommended for production)
    }
});

pool.getConnection((err, connection) => {
    if (err) {
        console.error('Error connecting to database:', err);
    } else {
        console.log('Database connection successful');
        connection.release();
    }
});

export default pool;