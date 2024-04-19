// backend/routes/transactionRoute.js
import TransactionController from '../controllers/transactionsController.js';

function transactionRoute(req, res, path, method) {
  if (path === '/api/admin/transaction' && method === 'GET') {
    TransactionController.getAllTransactions(req, res);
  } else if (path === '/api/transaction' && method === 'POST') {
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString(); // Convert buffer to string and append it
    });
    req.on('end', () => {
      const transactionData = JSON.parse(body); // Parse the string into JSON
      TransactionController.createTransaction(req, res, transactionData);
    });
  } else if (path.match(/^\/api\/transaction\/(\d+)$/) && method === 'DELETE') {
    const transactionId = path.split('/')[3]; // Assuming path format is /api/transaction/{id}
    TransactionController.deleteTransaction(req, res, transactionId);
  } else if (path.match(/^\/api\/transaction\/(\d+)$/) && method === 'PATCH') {
    const transactionId = path.split('/')[3]; // Extract transaction ID from URL
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString(); // Accumulate data
    });
    req.on('end', () => {
      const updatedData = JSON.parse(body); // Parse the updated data
      TransactionController.updateTransaction(req, res, { transactionId, updatedData });
    });
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default transactionRoute;
