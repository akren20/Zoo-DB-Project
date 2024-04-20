// backend/routes/transactionRoute.js
import TransactionsController from '../controllers/transactionController.js'; // Ensure file name matches exactly

function transactionRoute(req, res, path, method) {
  if (path === '/api/admin/transaction' && method === 'GET') {
    TransactionsController.getAllTransactions(req, res);
  } else if (path === '/api/transaction' && method === 'POST') {
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString();
    });
    req.on('end', () => {
      const transactionData = JSON.parse(body);
      TransactionsController.createTransaction(req, res, transactionData);
    });
  } else if (path.match(/^\/api\/transaction\/(\d+)$/) && method === 'DELETE') {
    const transactionId = path.split('/')[3];
    TransactionsController.deleteTransaction(req, res, { transactionId });
  } else if (path.match(/^\/api\/transaction\/(\d+)$/) && method === 'PATCH') {
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString();
    });
    req.on('end', () => {
      const updatedData = JSON.parse(body);
      const transactionId = path.split('/')[3];
      TransactionsController.updateTransaction(req, res, { transactionId, updatedData });
    });
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default transactionRoute;
