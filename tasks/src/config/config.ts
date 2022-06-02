import express, { Express } from 'express';
import dotenv from 'dotenv';
import routes from './routes';

dotenv.config();

const server: Express = express();
const port = process.env.PORT || 3000;

server.use(express.json());
//se debe deshabilitar el CORS para poder hacer pruebas con angular en local
server.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
  res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
  res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
  next();
});

server.use(routes);

server.listen(port, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});

export default server;