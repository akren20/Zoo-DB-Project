import express from 'express';
import AdminsController from '../controllers/adminController.js'; // Adjusted import to match controller filename

const router = express.Router();

// Get all employees
router.get('/employee', AdminsController.getAllEmployees);

// Add a new employee
router.post('/employee', AdminsController.addEmployee); // Changed to reflect the correct function and path

// Delete an employee - A specific employeeId is now included in the route
router.delete('/employee/:employeeId', AdminsController.deleteEmployee); // Adjusted for employee deletion

// Handle unsupported methods
router.all('*', (req, res) => {
    res.status(405).json({ message: 'Method Not Allowed' });
});

export default router;
