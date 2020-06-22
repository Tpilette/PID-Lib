import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API_URL } from 'src/app/app.constant';
import { Book } from 'src/app/interface/Book';
import { Edition } from 'src/app/interface/Edition';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BookService {

  constructor(private http: HttpClient) { }

  books: Book[] = [];

  getBooks(id:any){
    return this.http.get(`${API_URL}/Books/${id}`);
  }

  getBook(id: any):Book {    
    return this.books.find(x=>x.bookId == id);    
  }

  getEditions(id:any){

    return this.http.get(`${API_URL}/Book/${id}/Edition`);

  }
}
