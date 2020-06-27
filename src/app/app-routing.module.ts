import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './view/login/login.component';
import { HomeComponent } from './view/home/home.component';
import { BooksComponent } from './view/books/books.component';
import { BookComponent } from './view/book/book.component';
import { ProfilComponent } from './view/profil/profil.component';
import { Borrowing } from './interface/Borrowing';


const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'login', component: LoginComponent },
  { path: 'home', component: HomeComponent },
  { path: 'books/:id', component: BooksComponent },
  { path: 'book/:id', component: BookComponent },
  { path: 'borrow', component: Borrowing },
  { path: 'profil', component: ProfilComponent },
  { path: '**', component: HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
