const medicals = require('../Website-Files') /*medical.js file */
const { v4: uuidv4} = require('uuid')

const {writeDataToFile} = require('../utils')

function findAll() {
    return new Promise((resolve, reject) => {
        resolve(medicals)
    })
}

function findById(id) {
    return new Promise((resolve, reject) => {
        const medical = medicals.find((m) => m.id == id)
        resolve(medical)
    })
}

function create(medical) {
    return new Promise((resolve, reject) => {
        const newMedical = {id: uuidv4(), ...medical}
        medicals.push(newMedical)
        writeDataToFile('./medicaldata.json', medicals)
        resolve(newMedical)

    })
}


module.exports = {
    findAll,
    findById,
    create
}