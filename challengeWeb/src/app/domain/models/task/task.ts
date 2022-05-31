export interface Task {
	id: String;
	title: String;
	description: String;
	keyWords: Array<String>;
	finalPrice?: number;
	count: number;
	state: String;
	client: Reviewed;
	doer?: Reviewed;
	scheduleDate: Date;
	createdDate: Date;
	duration?: number;
}

export interface Reviewed {
    id: string;
    proposed_price: number;
    review: string;
    score: number;
}

export class Convert {
    public static toReview(json: string): Reviewed {
        return JSON.parse(json);
    }

    public static reviewToJson(value: Reviewed): string {
        return JSON.stringify(value);
    }

    public static toTask(json: string): Task {
        return JSON.parse(json);
    }

    public static taskToJson(value: Task): string {
        return JSON.stringify(value);
    }
}
