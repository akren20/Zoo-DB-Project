import express from 'express';
import EmployeeController from '../controllers/employeeController.js';

const router = express.Router();

router.get('/', EmployeeController.getAllEmployees);  // Changed to root for employee route
router.post('/', EmployeeController.createEmployee);  // Changed to root for POST
router.put('/:id', EmployeeController.updateEmployee);  // Ensure using '/:id' for specific employee
router.delete('/:id', EmployeeController.deleteEmployee);  // Ensure using '/:id' for specific employee

export default router;
