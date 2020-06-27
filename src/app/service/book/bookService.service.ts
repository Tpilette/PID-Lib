import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API_URL } from 'src/app/app.constant';
import { Book } from 'src/app/interface/Book';

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

  emprunter(l){
    return this.http.post<any>(`${API_URL}/Emprunter`,l);
  }
  getCopyTitle(copyId){
    return this.http.get(`${API_URL}/copyTitle/${copyId}`);
  }
}
