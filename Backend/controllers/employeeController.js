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

}

export default EmployeesController;