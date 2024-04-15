// backend/controllers/animalController.js
import GiftsModel from '../models/giftModel.js';

class GiftsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllGifts(req, res) {
    try {
      const items = await GiftsModel.findAllGifts();

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
  static async updateGiftShopItem(req, res) {
    try {
      const { id } = req.params;
      const updatedItem = await GiftShopModel.updateGiftShopItem(id, req.body);

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(updatedItem));

    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error message
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  // @desc  Delete Gift Shop Item
  // @route DELETE /api/gift-shop/:id
  static async deleteGiftShopItem(req, res) {
    try {
      const { id } = req.params;
      const deletedItem = await GiftShopModel.deleteGiftShopItem(id);

      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      
      res.end(JSON.stringify(deletedItem));

    } catch(err) {
      // Set error status code and content-type
      res.writeHead(500, { "Content-Type": "application/json" });
      // Send error message
      res.end(JSON.stringify({ message: err.message }));
    }
  }

}

export default GiftsController;