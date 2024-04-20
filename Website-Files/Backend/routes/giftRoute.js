// backend/routes/giftRoute.js
import GiftsController from '../controllers/giftController.js';

function giftRoute(req, res, path, method) {
  if (path === '/api/admin/gift' && method === 'GET') {
    GiftsController.getAllGifts(req, res);
  } else if (path === '/api/gift' && method === 'POST') {
    const giftData = JSON.parse(req.body);
    GiftsController.createGift(req, res, giftData);  // Assuming a createGift method exists
  } else if (path === '/api/gift/:id' && method === 'DELETE') {
    const { id } = req.params;
    GiftsController.deleteGiftShopItem(req, res, id);
  } else {
    res.writeHead(405, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ message: 'Method Not Allowed' }));
  }
}

export default giftRoute;
