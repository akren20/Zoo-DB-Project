const Medicals = require('../medicals/medicalModel')

//@desc Gets all Medical items
//@route GET /api/products
async function getMedicals(req,res) {
    try{
        const medicals = await Medicals.findAll()

        res.writeHead(200, {'Content-Type': 'application/json' })
        res.end(JSON.stringify(medicals))

    }
    catch (error){
        console.log(error)
    }
}

//@desc Gets Single Medical item
//@route GET /api/products
async function getMedical(req,res,id) {
    try{
        const medical = await Medical.findById(id)

        if(!medical) {
            res.writeHead(404, {'Content-Type': 'application/json' })
            res.end(JSON.stringify({message: 'Medicals Not Found'}))

        }

        else{
            res.writeHead(200, {'Content-Type': 'application/json' })
            res.end(JSON.stringify(medical))
        }

    }
    catch (error){
        console.log(error)
    }
}


//@desc Gets a Medical item
//@route GET /api/medicals
async function createMedical(req,res) {
    try{
        const medical = {
            title: 'Test Product',
            description: 'This is my product',
            price: 100
        }

        const newMedical = Medical.create(medical)

        res.writeHead(201, {'Content-Type': 'application/json' } )
        return res.end(JSON.stringify(newMedical))

    }
    catch (error){
        console.log(error)
    }
}


module.exports = {
    getMedicals,
    getMedical
}