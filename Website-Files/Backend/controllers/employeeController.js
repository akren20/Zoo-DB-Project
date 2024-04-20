// backend/controllers/employeeController.js
import EmployeesModel from '../models/employeeModel.js';

class EmployeeController {
  // GET all employees
  static async getAllEmployees(req, res) {
    try {
      const employees = await EmployeesModel.findAllEmployees();
      res.status(200).json(employees);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }

  // POST a new employee
  static async createEmployee(req, res) {
    try {
      const newEmployee = await EmployeesModel.createEmployee(req.body);
      res.status(201).json({
        message: "Employee created successfully",
        data: newEmployee
      });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }

  // PUT update an existing employee
  static async updateEmployee(req, res) {
    try {
      const { id } = req.params;  // The ID should be part of the URL path
      const updatedEmployee = await EmployeesModel.updateEmployee(id, req.body);
      res.status(200).json({
        message: "Employee updated successfully",
        data: updatedEmployee
      });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }

  // DELETE an employee
  static async deleteEmployee(req, res) {
    try {
      const { id } = req.params;  // The ID should be part of the URL path
      await EmployeesModel.deleteEmployee(id);
      res.status(200).json({ message: "Employee deleted successfully" });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
}

export default EmployeeController;
