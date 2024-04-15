import mysql from 'mysql';

const pool = mysql.createPool({
    connectionLimit: 10,
    host: "zoodb.cfmqaom2q89a.us-east-2.rds.amazonaws.com",
    user: 'admin',
    password: 'umadb123',
    database: 'Zoo-Project',
    ssl: {
        rejectUnauthorized: true
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