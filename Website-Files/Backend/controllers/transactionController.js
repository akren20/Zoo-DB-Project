// backend/controllers/transactionsController.js
import TransactionModel from '../models/transactionModel.js';

class TransactionsController {
  static async getAllTransactions(req, res) {
    try {
      const transactions = await TransactionModel.findAllTransactions();
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(transactions));
    } catch (err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async createTransaction(req, res) {
    try {
      const transactionData = req.body; // Assuming body-parser middleware is used
      const transactionId = await TransactionModel.insertTransaction(transactionData);
      res.writeHead(201, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Transaction created successfully", transactionId }));
    } catch (err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async updateTransaction(req, res) {
    try {
      const { transactionId, updatedData } = req.body;
      await TransactionModel.updateTransaction(transactionId, updatedData);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Transaction updated successfully" }));
    } catch (err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async deleteTransaction(req, res) {
    try {
      const { transactionId } = req.params;
      await TransactionModel.deleteTransaction(transactionId);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Transaction deleted successfully" }));
    } catch (err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }
}

export default TransactionsController;
