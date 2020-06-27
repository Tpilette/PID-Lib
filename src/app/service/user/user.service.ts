import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { API_URL } from 'src/app/app.constant';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }



  getEmprunt(readerId){
    let body = {"userMail":readerId};
    return this.http.post<any>(`${API_URL}/reader/emprunt`,body);
  }
}
