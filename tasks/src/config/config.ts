import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
import routes from './routes';

dotenv.config();

const server: Express = express();
const port = process.env.PORT || 3000;

server.use(express.json());
server.use(routes);

// server.get('/', (req: Request, res: Response, n) => {
//     res.send('Express + TypeScript Server.');
// });

server.listen(port, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});

export default server;