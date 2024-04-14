// backend/controllers/animalController.js
import FoodsModel from '../models/foodModel.js';

class FoodsController {
  // @desc  Gets All Items
  // @route GET /api/items
  static async getAllFoods(req, res) {
    try {
      const items = await FoodsModel.findAllFoods();

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

}

export default FoodsController;