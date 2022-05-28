import { CreateTaskUseCase } from './../domain/usecase/task/create_task_usecase';
import { TaskService } from './../infraestructure/driven_adapter/database/task/task.service';
import { TaskRouter } from './../infraestructure/entry_points/task/taskRouter';
import express from 'express';

const routes = express.Router();
const taskService = new TaskService();
const createTaskUseCase = new CreateTaskUseCase(taskService);
const taskRouter = new TaskRouter(createTaskUseCase);
routes.get('/task', taskRouter.getRouter())

export default routes