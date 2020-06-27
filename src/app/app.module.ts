import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './view/login/login.component';
import { HomeComponent } from './view/home/home.component';
import { MenuComponent } from './view/layout/menu/menu.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpInterceptorAuthService } from './service/auth/http-interceptor-auth.service';
import { BookComponent } from './view/book/book.component';
import { BooksComponent } from './view/books/books.component';
import { ProfilComponent } from './view/profil/profil.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    MenuComponent,
    BookComponent,
    BooksComponent,
    MenuComponent,
    ProfilComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: HttpInterceptorAuthService,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
