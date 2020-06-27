import { Borrowing } from './Borrowing';

export class Reader {
    readerId: number;
    name: string;
    lastname: string;
    phone: string;
    address: string;
    email: string;
    token: string;
    emprunt: Borrowing[];
}