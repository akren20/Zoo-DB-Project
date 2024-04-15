// backend/controllers/animalController.js
import AnimalsModel from '../models/animalModel.js';

class AnimalsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllAnimals(req, res) {
    try {
      // const [results] = await pool.query(`SELECT * FROM animal;`);
      const items = await AnimalsModel.findAllAnimals();

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
      // Assuming the tuple data is provided in the req.body object
      const { animal_type, animal_dob, animal_habitat, animal_gender, animal_health, animal_species, animal_status, animal_name } = req.body;
  
      // Construct the SQL INSERT INTO statement
      const sql = `INSERT INTO animal 
                    (animal_type, animal_dob, animal_habitat, animal_gender, animal_health, animal_species, animal_status, animal_name) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
  
      // Execute the SQL statement with the provided data
      await pool.query(sql, [animal_type, animal_dob, animal_habitat, animal_gender, animal_health, animal_species, animal_status, animal_name]);
  
      // Send response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Animal added successfully" }));
  
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error
      res.end(JSON.stringify({ message: err.message }));
    }
  }
  static async deleteAnimal(req, res) {
    try {
      // Assuming the animal_id is provided in the req.params object
      const animalId = req.params.animalId;
  
      // Construct the SQL DELETE statement
      const sql = `DELETE FROM animal WHERE animal_id = ?`;
  
      // Execute the SQL statement with the provided animal_id
      await pool.query(sql, [animalId]);
  
      // Send success response
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Animal deleted successfully" }));
    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error response
      res.end(JSON.stringify({ message: err.message }));
    }
  } 
  
}

export default AnimalsController;

//add insert and delete, update