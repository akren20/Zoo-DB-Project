// backend/controllers/animalController.js
import AdminsModel from '../models/adminModel.js';

class AdminsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllEmployees(req, res) {
    try {
      const items = await AdminsModel.findAllEmployees();

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
  static async updateAllEmployees(req, res) {
    try {
      // Assuming the tuple data is provided in the req.body object
      const { employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_hours_worked, employee_salary, hourly_rate, overtime_hours, employee_dept, employee_type, employee_role, employee_phone, employee_email, employee_address } = req.body;
  
      // Construct the SQL INSERT INTO statement
      const sql = `INSERT INTO employee 
                    (employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_hours_worked, employee_salary, hourly_rate, overtime_hours, employee_dept, employee_type, employee_role, employee_phone, employee_email, employee_address) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  
      // Execute the SQL statement with the provided data
      await pool.query(sql, [employee_name, employee_age, employee_gender, employee_dob, employee_ssn, employee_hours_worked, employee_salary, hourly_rate, overtime_hours, employee_dept, employee_type, employee_role, employee_phone, employee_email, employee_address]);
  
      // Send response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Employee added successfully" }));
  
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  static async deleteEmployee(req, res) {
    try {
      // Assuming the employee_id is provided in the req.params object
      const employeeId = req.params.employeeId;
  
      // Construct the SQL DELETE statement
      const sql = `DELETE FROM employee WHERE employee_id = ?`;
  
      // Execute the SQL statement with the provided employee_id
      await pool.query(sql, [employeeId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Employee deleted successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
  
}

export default AdminsController;