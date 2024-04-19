// backend/controllers/animalController.js
import AnimalsModel from '../models/animalModel.js';

class AnimalsController {
  static async getAllAnimals(req, res) {
    try {
      const items = await AnimalsModel.findAllAnimals();
      res.status(200).json(items);
    } catch(err) {
      res.status(500).json({ message: err.message });
    }
  }

  static async createAnimal(req, res) {
    try {
      const newAnimal = await AnimalsModel.createAnimal(req.body);
      res.status(201).json({ message: "Animal added successfully", animal: newAnimal });
    } catch(err) {
      res.status(500).json({ message: err.message });
    }
  }

  static async deleteAnimal(req, res) {
    try {
      await AnimalsModel.deleteAnimal(req.params.id);
      res.status(200).json({ message: "Animal deleted successfully" });
    } catch(err) {
      res.status(500).json({ message: err.message });
    }
  }
}

export default AnimalsController;
