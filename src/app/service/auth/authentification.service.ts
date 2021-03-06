import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { API_URL } from 'src/app/app.constant';

export const TOKEN = 'token'
export const AUTHENTICATED_USER = 'authenticaterUser'


@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  public logged;

  constructor(private http: HttpClient) { }
  getAuthenticatedUser() {
    return sessionStorage.getItem(AUTHENTICATED_USER);
  }
  getAuthenticatedToken() {
    return sessionStorage.getItem(TOKEN);
  }

  isUserLoggedIn() {
    const user = sessionStorage.getItem(AUTHENTICATED_USER);
    return !(user === null);
  }
  logout() {
    sessionStorage.removeItem(AUTHENTICATED_USER);
    sessionStorage.removeItem(TOKEN);
    this.logged = false;
  }

  executeJWTAuthenticationService(username, password) {
    return this.http.post<any>(
    `${API_URL}/authenticate`, {
    username,
    password}).pipe(
      map(
        data => {
          sessionStorage.setItem(AUTHENTICATED_USER, username);
          sessionStorage.setItem(TOKEN, `Bearer ${data.token}`);
          this.logged = true;
          return data;
        }
      )
    );
  }
}
