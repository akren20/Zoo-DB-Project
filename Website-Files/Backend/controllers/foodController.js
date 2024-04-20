// backend/controllers/foodController.js
import FoodsModel from '../models/foodModel.js';

class FoodController {
  static async getAllFoods(req, res) {
    try {
      const foods = await FoodsModel.findAllFoods();
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(foods));
    } catch(err) {
      res.writeHead(500, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async createFood(req, res, foodData) {
    // Implementation for creating a new food item
  }

  static async updateFoodShopItem(req, res) {
    try {
      const { id } = req.params;
      const updatedItem = await FoodsModel.updateFoodShopItem(id, req.body);
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(updatedItem));
    } catch(err) {
      res.writeHead(500, { "Content-Type": 'application/json' });
      res.end(JSON.stringify({ message: err.message }));
    }
  }

  static async deleteFoodShopItem(req, res, id) {
    try {
      const deletedItem = await FoodsModel.deleteFoodShopItem(id);
      res.writeHead(200, {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*"
      });
      res.end(JSON.stringify(deletedItem));
    } catch(err) {
      res.writeHead(500, { "Content-Type": 'application/json' });
      res.end(JSON.stringify({ message: err.message }));
    }
  }
}

export default FoodController;
