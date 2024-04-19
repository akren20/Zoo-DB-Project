import express from 'express';
import AdminController from '../controllers/adminController.js';

const router = express.Router();

// Get all employees
router.get('/admin/employee', AdminController.getAllEmployees);

// Create a new item - assuming this is an admin item; if it’s for employees, this needs clarification
router.post('/admin', AdminController.createItem);

// Delete an item - similarly, this needs to point to a specific method for deletion
router.delete('/admin', AdminController.deleteItem);  // Change `createItem` to `deleteItem` in your AdminController if not done already

// Handle unsupported methods
router.all('*', (req, res) => {
    res.status(405).json({ message: 'Method Not Allowed' });
});

export default router;
