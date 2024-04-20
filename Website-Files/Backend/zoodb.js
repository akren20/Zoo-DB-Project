import mysql from 'mysql2';
let instance = null;

const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'zoodb.cfmqaom2q89a.us-east-2.rds.amazonaws.com',
    user: 'admin',
    password: 'UMADB123',
    database: 'zoodb',
    port: 3306,
    ssl: {
        rejectUnauthorized: false // Disable SSL verification (not recommended for production)
    }
});

pool.getConnection((err, connection) => {
    if (err) {
        console.error('Error connecting to database:', err);
    } 
    else {
        console.log('Database connection successful');
        connection.release();
    }
});

// export default pool;

class DbService{
    static getDbServiceInstance() {
        return instance ? instance : new DbService();
    }
    async getAllData() {
        try{
            const response = await new Promise((resolve, reject) => {
                const query = 'SELECT * FROM employee';
                connection.query(query,(err,results) => {
                    if (err) reject(new Error(err.message));
                    resolve(results);
                })
            });

            // console.log(response);
            return response;

        }
        catch(error) { 
            console.log(error);
        }
    }
}

export {pool, DbService};
export default pool;

