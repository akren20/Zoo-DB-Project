// backend/routes/customerRoute.js
import express from 'express';
import CustomerController from '../controllers/customerController.js';

const router = express.Router();

// Define the route for getting all customers
router.get('/admin/customers', CustomerController.getAllCustomers);

// Define the route for creating a new customer
router.post('/customers', CustomerController.createCustomer);

// Define the route for deleting a customer
router.delete('/customers/:id', CustomerController.deleteCustomer);

// Optionally handle unsupported methods for customer-related endpoints
router.all('/customers', (req, res) => {
  res.status(405).json({ message: 'Method Not Allowed' });
});

export default router;
