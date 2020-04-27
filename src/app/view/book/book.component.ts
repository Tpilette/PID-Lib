import { Component, OnInit } from '@angular/core';
import { BookService } from 'src/app/service/book/bookService.service';
import { Book } from 'src/app/interface/Book';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-book',
  templateUrl: './book.component.html',
  styleUrls: ['./book.component.css']
})
export class BookComponent implements OnInit {

  book: Book;

  constructor(private route: ActivatedRoute,
              private BookService: BookService
              ){ }

  ngOnInit(): void {
    const id = this.route.snapshot.params.id;
    this.book = this.BookService.getBook(id);
  }

}
