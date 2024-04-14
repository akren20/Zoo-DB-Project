// backend/routes/adminRoute.js include admin controller file down below
import TransactionController from '../controllers/transactionController.js' ;

function transactionRoute(req, res, path, method) {
  res.writeHead(200, {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*"
  });
  
  if (path === '/api/admin/transaction' && method === 'GET') {
    TransactionController.getAllTransactions(req,res);
  } 
  else if (path === '/api/transaction' && method === 'POST') {
    const itemData = JSON.parse(req.body);
    TransactionController.createItem(req,res,itemData);
  } 
  else if (path === '/api/transaction' && method === 'DELETE') {
    const itemData = JSON.parse(req.body);
    TransactionController.createItem(req,res,itemData);
  }
  else {
    // Handle other HTTP methods if needed
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}
  
export default transactionRoute;