import express from 'express';
import cors from 'cors';

// Import route handlers
import animalRoute from './routes/animalRoute.js';
import customerRoute from './routes/customerRoute.js';
import employeeRoute from './routes/employeeRoute.js';
import eventRoute from './routes/eventRoute.js';
import foodRoute from './routes/foodRoute.js';
import giftRoute from './routes/giftRoute.js';
import habitatRoute from './routes/habitatRoute.js';
import healthRoute from './routes/healthRoute.js';
import medicalRoute from './routes/medicalRoute.js';
import transactionRoute from './routes/transactionRoute.js';
import adminRoute from './routes/adminRoute.js';

const app = express();
const port = process.env.PORT || 5001;

// Middleware to handle JSON, CORS
app.use(express.json());
app.use(cors());

// Route handlers
app.use('/api/animals', animalRoute);
app.use('/api/customers', customerRoute);
app.use('/api/employees', employeeRoute);
app.use('/api/events', eventRoute);
app.use('/api/foods', foodRoute);
app.use('/api/gifts', giftRoute);
app.use('/api/habitats', habitatRoute);
app.use('/api/healths', healthRoute);
app.use('/api/medicals', medicalRoute);
app.use('/api/transactions', transactionRoute);
app.use('/api/admin', adminRoute);

// GET route to confirm server is running
app.get('/', (req, res) => {
  res.send('Welcome to the API. Server is running.');
});

// 404 Not Found Handler
app.use((req, res, next) => {
  res.status(404).json({ message: 'Resource not found' });
});

// General error handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Something went wrong' });
});

// Start the server
app.listen(port, () => {
  console.log(`Server started on port: ${port}, navigate to http://localhost:${port}/`);
});
