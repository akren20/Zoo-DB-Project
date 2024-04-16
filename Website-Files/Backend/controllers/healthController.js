// backend/controllers/animalController.js
import HealthsModel from '../models/healthModel.js';

class HealthsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllHealths(req, res) {
    try {
      const items = await HealthsModel.findAllHealths();

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

  static async updateHealth(req, res) {
    try {
      // Extract health data from request body
      const { healthId, updatedData } = req.body;
  
      // Construct the SQL UPDATE statement
      const sql = `UPDATE health SET ? WHERE health_id = ?`;
  
      // Execute the SQL statement with the provided health data and ID
      await pool.query(sql, [updatedData, healthId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Health record updated successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
  static async deleteHealth(req, res) {
    try {
      // Assuming the healthId is provided in the req.params object
      const healthId = req.params.healthId;
  
      // Construct the SQL DELETE statement
      const sql = `DELETE FROM health WHERE health_id = ?`;
  
      // Execute the SQL statement with the provided healthId
      await pool.query(sql, [healthId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Health record deleted successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  

}

export default HealthsController;