import { Component, OnInit } from '@angular/core';
import { BookService } from 'src/app/service/book/bookService.service';
import { Observable } from 'rxjs';
import { ActivatedRoute } from '@angular/router';
import { Edition } from 'src/app/interface/Edition';

@Component({
  selector: 'app-edition',
  templateUrl: './edition.component.html',
  styleUrls: ['./edition.component.css']
})
export class EditionComponent implements OnInit {

 editions: Edition[] = [];

  constructor(private route: ActivatedRoute,private bookService : BookService) { }

  ngOnInit(): void {
    const id = this.route.snapshot.params.id;
    this.bookService.getEditions(id).subscribe(
      response => {
        this.editions = (response as Array<Edition>)
      }
    ); 
  }

} 
