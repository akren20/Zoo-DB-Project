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
  static async updateAllAnimals(req, res) {
    try {
      const [results] = await pool.query(`SELECT * FROM medical;`);

      
      
      res.end(JSON.stringify(items));

    } catch(err) {
      // set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // send error
      res.end(JSON.stringify({ message: err.message }));

    }
  }
}

export default MedicalsController;

//add insert and delete, update