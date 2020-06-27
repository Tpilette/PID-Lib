import { Component, OnInit } from '@angular/core';
import {Reader} from 'src/app/interface/User'
import { API_URL } from 'src/app/app.constant';
import { UserService } from 'src/app/service/user/user.service';
import { AUTHENTICATED_USER } from 'src/app/service/auth/authentification.service';
import { Borrowing } from 'src/app/interface/Borrowing';
import { formatDate } from '@angular/common';
import { BookService } from 'src/app/service/book/bookService.service';
import { delay } from 'rxjs/operators';

@Component({
  selector: 'app-profil',
  templateUrl: './profil.component.html',
  styleUrls: ['./profil.component.css']
})
export class ProfilComponent implements OnInit {

  constructor(private userServ: UserService,private bookService: BookService) { }

  lecteur: Reader;
  emprunts: Borrowing[];

  

  ngOnInit(): void {    
     this.getEmprunts();
  }


  getEmprunts(){

    let user = sessionStorage.getItem(AUTHENTICATED_USER)  
    this.userServ.getEmprunt(user).subscribe(
      response => {
        this.emprunts = response;   
        this.emprunts.forEach(element => {
          this.bookService.getCopyTitle(element.copyId).subscribe(
             data => {
               element.title = (data as string);
             }
           );
          }); 
      }
    ); 
  }
  
}
