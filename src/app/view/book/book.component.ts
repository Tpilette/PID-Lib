import { Component, OnInit } from '@angular/core';
import { BookService } from 'src/app/service/book/bookService.service';
import { Book } from 'src/app/interface/Book';
import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { AuthenticationService, AUTHENTICATED_USER } from 'src/app/service/auth/authentification.service';
import { LocationParam } from 'src/app/interface/Location';
import { Session } from 'protractor';

@Component({
  selector: 'app-book',
  templateUrl: './book.component.html',
  styleUrls: ['./book.component.css']
})
export class BookComponent implements OnInit {

  book: Book;
  loc: LocationParam;

  constructor(private route: ActivatedRoute,
              private bookService: BookService
              ){ }

  ngOnInit(): void {
    const id = this.route.snapshot.params.id;
    this.book = this.bookService.getBook(id);  
  }  


  emprunter(){  
    
    this.loc = new LocationParam();
    this.loc.bookId = this.book.bookId;
    this.loc.username = sessionStorage.getItem(AUTHENTICATED_USER);  
    this.bookService.emprunter(this.loc)
    .subscribe(
       data=>
      {
        console.log(data);
        alert("Location effectuée ! Merci");
      })
  }
 

}
