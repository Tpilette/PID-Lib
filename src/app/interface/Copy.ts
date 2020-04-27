import { Edition } from './edition';
import { Bibliotheque } from './bibliotheque';

export class Copy {
    copyId: number;
    stateId: number;
    statusId: number;
    edition: Edition;
    bibliotheque: Bibliotheque;    
}