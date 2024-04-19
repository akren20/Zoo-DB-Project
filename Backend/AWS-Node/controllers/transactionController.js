// backend/controllers/transactionsController.js
import TransactionsModel from '../models/transactionsModel.js';

class TransactionsController {
  static async getAllTransactions(req, res) {
    try {
      const transactions = await TransactionsModel.findAllTransactions();
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(transactions));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async createTransaction(req, res, transactionData) {
    try {
      const transactionId = await TransactionsModel.insertTransaction(transactionData);
      res.writeHead(201, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Transaction created successfully", transactionId }));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async updateTransaction(req, res) {
    try {
      const { transactionId, updatedData } = req.body;
      await TransactionsModel.updateTransaction(transactionId, updatedData);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Transaction updated successfully" }));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async deleteTransaction(req, res) {
    try {
      const { transactionId } = req.params;
      await 
// backend/controllers/animalController.js
import TransactionsModel from '../models/transactionModel.js';

class TransactionsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllTransactions(req, res) {
    try {
      // const [results] = await pool.query(`SELECT * FROM transaction;`);
      const items = await TransactionsModel.findAllTransactions();

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
  static async updateTransaction(req, res) {
    try {
      // Extract transaction data from request body
      const { transactionId, updatedData } = req.body;
  
      // Construct the SQL UPDATE statement
      const sql = `UPDATE transaction SET ? WHERE transaction_id = ?`;
  
      // Execute the SQL statement with the provided transaction data and ID
      await pool.query(sql, [updatedData, transactionId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Transaction updated successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
  static async deleteTransaction(req, res) {
    try {
      // Assuming the transaction_id is provided in the req.params object
      const transactionId = req.params.transactionId;
  
      // Construct the SQL DELETE statement
      const sql = `DELETE FROM transaction WHERE transaction_id = ?`;
  
      // Execute the SQL statement with the provided transaction_id
      await pool.query(sql, [transactionId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Transaction deleted successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
}

export default TransactionsController;

//add insert and delete, update