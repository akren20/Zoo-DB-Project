// backend/controllers/animalController.js
import EmployeesModel from '../models/employeeModel.js';

class EmployeesController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllEmployees(req, res) {
    try {
      const items = await EmployeesModel.findAllEmployees();

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(items));

    } catch(err) {
      // set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // send error
      res.end(JSON.stringify({ message: err.message }));

    }
  }
  // @desc  Update Employee
  // @route PUT /api/employees/:id
  static async updateEmployee(req, res) {
    try {
      const { id } = req.params;
      const updatedEmployee = await EmployeeModel.updateEmployee(id, req.body);

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(updatedEmployee));

    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error message
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  // @desc  Delete Employee
  // @route DELETE /api/employees/:id
  static async deleteEmployee(req, res) {
    try {
      const { id } = req.params;
      const deletedEmployee = await EmployeeModel.deleteEmployee(id);

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(deletedEmployee));

    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error message
      res.end(JSON.stringify({ message: err.message }));
    }
  }

}

export default EmployeesController;