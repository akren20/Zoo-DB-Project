// backend/controllers/customerController.js
import CustomersModel from '../models/customerModel.js';

class CustomerController {
  // GET all customers
  static async getAllCustomers(req, res) {
    try {
      const customers = await CustomersModel.findAllCustomers();
      res.status(200).json(customers);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }

  // POST a new customer
  static async createCustomer(req, res) {
    try {
      const newCustomer = await CustomersModel.createCustomer(req.body);
      res.status(201).json({
        message: "Customer created successfully",
        customer: newCustomer
      });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }

  // DELETE a customer
  static async deleteCustomer(req, res) {
    try {
      const { id } = req.params;  // The ID should be part of the URL path
      await CustomersModel.deleteCustomer(id);
      res.status(200).json({ message: "Customer deleted successfully" });
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  }
}

export default CustomerController;
