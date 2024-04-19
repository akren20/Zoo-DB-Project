// backend/models/animalModel.js
import pool from '../zoodb.js';

class AnimalsModel {
  static async findAllAnimals() {
    const [results] = await pool.query('SELECT * FROM animal;');
    return results;
  }

  static async createAnimal(data) {
    const { animal_type, animal_dob, animal_habitat, animal_gender, animal_health, animal_species, animal_status, animal_name } = data;
    const sql = `INSERT INTO animal (animal_type, animal_dob, animal_habitat, animal_gender, animal_health, animal_species, animal_status, animal_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
    const [result] = await pool.execute(sql, [animal_type, animal_dob, animal_habitat, animal_gender, animal_health, animal_species, animal_status, animal_name]);
    return { id: result.insertId, ...data };
  }

  static async deleteAnimal(animalId) {
    const sql = `DELETE FROM animal WHERE animal_id = ?`;
    await pool.execute(sql, [animalId]);
  }
}

export default AnimalsModel;
