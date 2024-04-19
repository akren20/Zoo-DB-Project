// backend/routes/employeeRoute.js
import express from 'express';
import EmployeeController from '../controllers/employeeController.js';

const router = express.Router();

// Route for getting all employees
router.get('/employees', EmployeeController.getAllEmployees);

// Route for creating a new employee
router.post('/employees', EmployeeController.createEmployee);

// Route for updating an existing employee
router.put('/employees/:id', EmployeeController.updateEmployee);

// Route for deleting an existing employee
router.delete('/employees/:id', EmployeeController.deleteEmployee);

// Optionally handle unsupported methods for specific paths
router.all('/employees', (req, res) => {
  res.status(405).json({ message: 'Method Not Allowed' });
});

export default router;
