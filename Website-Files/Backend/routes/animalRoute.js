// backend/routes/animalRoute.js
import express from 'express';
import AnimalController from '../controllers/animalController.js';

const router = express.Router();

router.get('/animals', AnimalController.getAllAnimals);
router.post('/animals', AnimalController.createAnimal);
router.delete('/animals/:id', AnimalController.deleteAnimal);

export default router;
