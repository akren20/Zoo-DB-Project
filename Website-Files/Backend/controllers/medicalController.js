// backend/controllers/medicalsController.js
import MedicalsModel from '../models/medicalModel.js';

class MedicalsController {
  static async getAllMedicals(req, res) {
    try {
      const medicals = await MedicalsModel.findAllMedicals();
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(medicals));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async createMedical(req, res, medicalData) {
    try {
      const result = await MedicalsModel.insertMedical(medicalData);
      res.writeHead(201, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Medical record created successfully", id: result.insertId }));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async updateMedical(req, res) {
    try {
      const { medicalId, updatedData } = req.body;
      await MedicalsModel.updateMedical(medicalId, updatedData);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Medical record updated successfully" }));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async deleteMedical(req, res) {
    try {
      const { medicalId } = req.params;
      await MedicalsModel.deleteMedical(medicalId);
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: "Medical record deleted successfully" }));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }
}

export default MedicalsController;
