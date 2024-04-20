// api/routes/cartRoutes.js
import express from 'express';
import { handleAddToCart } from '../controllers/cartController.js';

const router = express.Router();

router.post('/add-to-cart', handleAddToCart);

export default router;
