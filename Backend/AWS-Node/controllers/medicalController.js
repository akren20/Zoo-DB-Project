// backend/controllers/animalController.js
import MedicalsModel from '../models/medicalModel.js';

class MedicalsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllMedicals(req, res) {
    try {
      // const [results] = await pool.query(`SELECT * FROM medical;`);
      const items = await MedicalsModel.findAllMedicals();

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
  static async updateMedical(req, res) {
    try {
      // Extract medical data from request body
      const { medicalId, updatedData } = req.body;
  
      // Construct the SQL UPDATE statement
      const sql = `UPDATE medical SET ? WHERE medical_sku = ?`;
  
      // Execute the SQL statement with the provided medical data and ID
      await pool.query(sql, [updatedData, medicalId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Medical record updated successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
  static async deleteMedical(req, res) {
    try {
      // Assuming the medicalId is provided in the req.params object
      const medicalId = req.params.medicalId;
  
      // Construct the SQL DELETE statement
      const sql = `DELETE FROM medical WHERE medical_sku = ?`;
  
      // Execute the SQL statement with the provided medicalId
      await pool.query(sql, [medicalId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Medical record deleted successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  
}

export default MedicalsController;

//add insert and delete, update