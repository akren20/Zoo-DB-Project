// backend/controllers/animalController.js
import AnimalsModel from '../models/animalModel.js';

class AnimalsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllAnimals(req, res) {
    try {
      const [results] = await pool.query(`SELECT * FROM animal;`);

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
      const [results] = await pool.query(`SELECT * FROM animal;`);

      
      
      res.end(JSON.stringify(items));

    } catch(err) {
      // set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // send error
      res.end(JSON.stringify({ message: err.message }));

    }
  }
}

export default AnimalsController;

//add insert and delete, update