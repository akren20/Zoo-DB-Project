// backend/controllers/animalController.js
import CustomersModel from '../models/customerModel.js';

class CustomersController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllCustomers(req, res) {
    try {
      const items = await CustomersModel.findAllCustomers();

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
  static async updateCustomer(req, res) {
    try {
      // Extract customer data from request body
      const { customerId, updatedData } = req.body;
  
      // Construct the SQL UPDATE statement
      const sql = `UPDATE customer SET ? WHERE customer_id = ?`;
  
      // Execute the SQL statement with the provided customer data and ID
      await pool.query(sql, [updatedData, customerId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Customer updated successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
  static async deleteCustomer(req, res) {
    try {
      // Assuming the customer_id is provided in the req.params object
      const customerId = req.params.customerId;
  
      // Construct the SQL DELETE statement
      const sql = `DELETE FROM customer WHERE customer_id = ?`;
  
      // Execute the SQL statement with the provided customer_id
      await pool.query(sql, [customerId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Customer deleted successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  

}

export default CustomersController;