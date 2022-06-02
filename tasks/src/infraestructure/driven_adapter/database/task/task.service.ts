import { Observable, map, of, mergeMap, from } from 'rxjs';
import { Task } from '../../../../domain/models/task/task';
import { TaskGateway } from './../../../../domain/models/task/gateway/task_gateway';
import * as mongoDB from "mongodb";
import { TaskData, ConvertTaskData } from './taskData';

export class TaskService implements TaskGateway {
    uri = 'mongodb://localhost:27017';
    private _client: mongoDB.MongoClient;
    private _db: mongoDB.Db;
    private _collection: mongoDB.Collection<TaskData>;

    constructor() {
        const DB_NAME = 'challenge';
        const COLLECTION_NAME = 'tasks';
        this._client = new mongoDB.MongoClient(this.uri);
        this._client.connect();
        this._db = this._client.db(DB_NAME);
        this._db.command({ping: 1});
        console.log("Connected successfully  to mongo");
        this._collection = this._db.collection(COLLECTION_NAME);
    }

    closeConnection(): void {
        this._client.close();
    }


    createTask(task: Task): Observable<Task> {
        return of(new TaskData(task))
                .pipe(
                    mergeMap(data => from(this._collection.insertOne(data))),
                    mergeMap(savedDate => this._collection.findOne({_id: savedDate.insertedId})),
                    map(mongoTask => ConvertTaskData.toTask(mongoTask))
                );
    }

}