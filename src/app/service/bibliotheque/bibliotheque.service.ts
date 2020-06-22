import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API_URL } from 'src/app/app.constant';
import { map } from 'rxjs/operators';
import { AuthenticationService } from '../auth/authentification.service';

@Injectable({
  providedIn: 'root'
})
export class BibliothequeService {

  constructor(private http: HttpClient,private authService : AuthenticationService) { }



  borrowBook(ISBN) {
    let user = this.authService.getAuthenticatedUser();
    let date = new Date("dd/mm/yyyy");
    return this.http.post<any>(
      `${API_URL}/Borrow`,{ISBN,user})
      .pipe(
        map(
          data => { return data; }
        )
      );
  }

}
