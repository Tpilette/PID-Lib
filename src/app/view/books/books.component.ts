import { Component, OnInit } from '@angular/core';
import { BookService } from 'src/app/service/book/bookService.service';
import { Book } from 'src/app/interface/Book';

@Component({
  selector: 'app-books',
  templateUrl: './books.component.html',
  styleUrls: ['./books.component.css']
})
export class BooksComponent implements OnInit {

  constructor(private BookService: BookService) { }

  books: Book[];

  ngOnInit(): void {
 
    this.BookService.getBooks(1).subscribe(
      response=>{
        this.BookService.books = (response as Array<Book>);
        this.books = this.BookService.books;
      }
    )
  }  
}
