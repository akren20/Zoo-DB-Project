// backend/models/itemsModel.js
const pool = require( '../zoodb.js');

class EmployeesModel {
  static async findAllEmployees() {
    try {
      const [result] = await pool.query(`SELECT * FROM employee;`);
      return result;
    } catch(err) {
      console.log(err);
      throw new Error('Failed to retrieve all items');
    }
  }
}

module.exports.default  = EmployeesModel;