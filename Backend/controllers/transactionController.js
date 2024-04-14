// backend/controllers/animalController.js
import TransactionsModel from '../models/transactionModel.js';

class TransactionsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllTransactions(req, res) {
    try {
      const [results] = await pool.query(`SELECT * FROM transaction;`);

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(items));

    } catch(err) {
      // set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // send error
      res.end(JSON.stringify({ message: err.message }));

    }
  }
  static async updateAlltransaction(req, res) {
    try {
      const [results] = await pool.query(`SELECT * FROM transaction;`);

      
      
      res.end(JSON.stringify(items));

    } catch(err) {
      // set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // send error
      res.end(JSON.stringify({ message: err.message }));

    }
  }
}

export default TransactionsController;

//add insert and delete, update