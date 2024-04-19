// backend/controllers/habitatsController.js
import HabitatsModel from '../models/habitatsModel.js';

class HabitatsController {
  static async getAllHabitats(req, res) {
    try {
      const habitats = await HabitatsModel.findAllHabitats();
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(habitats));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async updateHabitat(req, res) {
    try {
      const { habitatId, updatedData } = req.body;
      const sql = `UPDATE habitat SET ? WHERE habitat_id = ?`;
      await pool.query(sql, [updatedData, habitatId]);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Habitat updated successfully" }));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async deleteHabitat(req, res) {
    try {
      const { habitatId } = req.params;
      const sql = `DELETE FROM habitat WHERE habitat_id = ?`;
      await pool.query(sql, [habitatId]);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Habitat deleted successfully" }));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }
}

export default HabitatsController;
