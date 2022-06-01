import { Observable, of } from 'rxjs';
import { delay, map } from 'rxjs/operators';

export function getMockResponse(): Observable<string> {
    return of({
            "id": "asdD15drasdf3",
            "title": "Sacar a la casa",
            "description": "Sacar a la casa, esta aburrida",
            "keyWords": ["ventana","lavar","dos pisos"],
            "count": 40,
            "state": "NEW",
            "client": {
                "id": "1",
                "proposed_price": 12,
            },
            "scheduleDate": new Date("2022-05-28 13:30:00.000Z")
        }).pipe(
            map(data => JSON.stringify(data)),
            delay(2000)
        );
}
