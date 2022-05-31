import { ObjectId, WithId } from 'mongodb';
import { Reviewed, Task } from './../../../../domain/models/task/task';

export class TaskData {
    _id: ObjectId;
    title: String;
    description: String;
    keyWords: String[];
    finalPrice?: number | undefined;
    count: number;
    state: String;
    client: Reviewed;
    doer?: Reviewed | undefined;
    scheduleDate: Date;
    createdDate: Date;
    duration?: number | undefined;
    constructor(task: Task) {
        this._id = new ObjectId();
        this.title = task.title;
        this.description = task.description;
        this.keyWords = task.keyWords;
        this.finalPrice = task.finalPrice;
        this.count = task.count;
        this.state = task.state;
        this.client = task.client;
        this.doer = task.doer;
        this.scheduleDate = task.scheduleDate;
        this.createdDate = task.createdDate;
        this.duration = task.duration;
    }
}

export class ConvertTaskData {

    public static toTaskData(json: string): TaskData {
        return JSON.parse(json);
    }

    public static taskDataToJson(value: TaskData): string {
        return JSON.stringify(value);
    }

    public static toTask(taskDate: WithId<TaskData> | null): Task {
        return {
            id: taskDate!._id.toString(),
            title: taskDate!.title,
            description: taskDate!.description,
            keyWords: taskDate!.keyWords,
            finalPrice: taskDate!.finalPrice,
            count: taskDate!.count,
            state: taskDate!.state,
            client: taskDate!.client,
            doer: taskDate!.doer,
            scheduleDate: taskDate!.scheduleDate,
            createdDate: taskDate!.createdDate,
            duration: taskDate!.duration
        }
    }
}