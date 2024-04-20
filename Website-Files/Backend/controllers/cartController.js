// api/controllers/cartController.js
import { addToCart } from '../services/cartService.js';

export const handleAddToCart = (req, res) => {
    const { userId, ticketId, quantity } = req.body;
    addToCart(userId, ticketId, quantity, (err, result) => {
        if (err) {
            res.status(500).json({ message: "Error adding to cart", error: err });
        } else {
            res.status(200).json({ message: "Added to cart", data: result });
        }
    });
};
