import { CreateTaskUseCase } from './../domain/usecase/task/create_task_usecase';
import { TaskService } from './../infraestructure/driven_adapter/database/task/task.service';
import { TaskRouter } from './../infraestructure/entry_points/task/taskRouter';
import express from 'express';

const routes = express.Router();
const taskService = new TaskService();
const createTaskUseCase = new CreateTaskUseCase(taskService);
const taskRouter = new TaskRouter(createTaskUseCase);
routes.use('/task', taskRouter.getRouter())

//defaul route
routes.get("*", function (req, res) {
    res.status(404).send("Error_page");
});

export default routes