// backend/controllers/giftsController.js
import GiftsModel from '../models/giftsModel.js';  // Make sure the file name is giftsModel.js

class GiftsController {
  static async getAllGifts(req, res) {
    try {
      const gifts = await GiftsModel.findAllGifts();
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(gifts));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async updateGiftShopItem(req, res) {
    try {
      const { id } = req.params;
      const updatedItem = await GiftsModel.updateGiftShopItem(id, req.body);
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(updatedItem));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async deleteGiftShopItem(req, res) {
    try {
      const { id } = req.params;
      const deletedItem = await GiftsModel.deleteGiftShopItem(id);
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(deletedItem));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }
}

export default GiftsController;
