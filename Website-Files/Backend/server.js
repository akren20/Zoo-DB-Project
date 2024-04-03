const http = require('http')
const {getMedicals,getMedical, createMedical} = require('./controllers/')

const server = http.createServer((req, res) => {
    if(req.url == '/api/medicals') {
        getMedicals(req,res)
    } 
    else if(req.url.match(/\/api\/medicals\/([0-9]+)/) && req.method == 'GET') {
        const id = req.url.split('/')
        getMedicals(req,res,id)
    }

    else if(req.url === '/api/medicals' && req.method === 'POST') {
        createMedical(req,res)
    }
    
    else{
        res.writeHead(404, {'Content-Type': 'application/json' })
        res.end(JSON.stringify({message:'Route Not Found'}))
    }
})



const PORT = process.env.PORT || 5000

server.listen(PORT, () => console.log(`Server running on port ${PORT}`))