// api/services/cartService.js
import pool from '../../config/db.js';  // Adjust the path as necessary

export const addToCart = (userId, ticketId, quantity, callback) => {
    pool.query('SELECT id FROM carts WHERE user_id = ?', [userId], (err, results) => {
        if (err) {
            return callback(err);
        }
        let cartId;
        if (results.length > 0) {
            cartId = results[0].id;
            addOrUpdateCartItem(cartId, ticketId, quantity, callback);
        } else {
            pool.query('INSERT INTO carts (user_id) VALUES (?)', [userId], (err, results) => {
                if (err) {
                    return callback(err);
                }
                cartId = results.insertId;
                addOrUpdateCartItem(cartId, ticketId, quantity, callback);
            });
        }
    });
};

const addOrUpdateCartItem = (cartId, ticketId, quantity, callback) => {
    pool.query('SELECT quantity FROM cart_items WHERE cart_id = ? AND ticket_id = ?', [cartId, ticketId], (err, results) => {
        if (err) {
            return callback(err);
        }
        if (results.length > 0) {
            let newQuantity = results[0].quantity + quantity;
            pool.query('UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND ticket_id = ?', [newQuantity, cartId, ticketId], callback);
        } else {
            pool.query('INSERT INTO cart_items (cart_id, ticket_id, quantity) VALUES (?, ?, ?)', [cartId, ticketId, quantity], callback);
        }
    });
};
