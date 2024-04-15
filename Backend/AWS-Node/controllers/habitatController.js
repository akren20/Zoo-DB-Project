// backend/controllers/animalController.js
import HabitatsModel from '../models/habitatModel.js' ;

class HabitatsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllHabitats(req, res) {
    try {
      const items = await HabitatsModel.findAllHabitats();

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
  static async updateHabitat(req, res) {
    try {
      // Extract habitat data from request body
      const { habitatId, updatedData } = req.body;
  
      // Construct the SQL UPDATE statement
      const sql = `UPDATE habitat SET ? WHERE habitat_id = ?`;
  
      // Execute the SQL statement with the provided habitat data and ID
      await pool.query(sql, [updatedData, habitatId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Habitat record updated successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
  static async deleteHabitat(req, res) {
    try {
      // Assuming the habitatId is provided in the req.params object
      const habitatId = req.params.habitatId;
  
      // Construct the SQL DELETE statement
      const sql = `DELETE FROM habitat WHERE habitat_id = ?`;
  
      // Execute the SQL statement with the provided habitatId
      await pool.query(sql, [habitatId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Habitat record deleted successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  

}

export default HabitatsController;