// backend/models/medicalsModel.js
import pool from '../zoodb.js';

class MedicalsModel {
  static async findAllMedicals() {
    try {
      const [results, _] = await pool.query(`SELECT * FROM medical;`);
      return results;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all medical records');
    }
  }

  static async insertMedical(medicalData) {
    try {
      const sql = `INSERT INTO medical SET ?;`;
      const result = await pool.query(sql, medicalData);
      return result[0];
    } catch(err) {
      console.log(err);
      throw new Error('Failed to insert medical record');
    }
  }

  static async updateMedical(medicalId, updatedData) {
    try {
      const sql = `UPDATE medical SET ? WHERE medical_sku = ?;`;
      await pool.query(sql, [updatedData, medicalId]);
    } catch(err) {
      console.log(err);
      throw new Error('Failed to update medical record');
    }
  }

  static async deleteMedical(medicalId) {
    try {
      const sql = `DELETE FROM medical WHERE medical_sku = ?;`;
      await pool.query(sql, [medicalId]);
    } catch(err) {
      console.log(err);
      throw new Error('Failed to delete medical record');
    }
  }
}

export default MedicalsModel;
