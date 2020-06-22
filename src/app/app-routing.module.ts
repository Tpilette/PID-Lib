import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './view/login/login.component';
import { HomeComponent } from './view/home/home.component';
import { BooksComponent } from './view/books/books.component';
import { BookComponent } from './view/book/book.component';
import { EditionComponent } from './view/edition/edition.component';
import { Borrowing } from './interface/Borrowing';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'login', component: LoginComponent },
  { path: 'home', component: HomeComponent },
  { path: 'books/:id', component: BooksComponent },
  { path: 'book/:id', component: BookComponent },
  { path: 'edition/:id', component: EditionComponent },
  { path: 'borrow/:id', component: Borrowing },
  { path: '**', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
