import { FormBuilder } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from 'src/app/service/auth/authentification.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  login;
  token;
  logged = false;

  loginForm = this.fb.group({
    mail: [],
    password: []
  });

  constructor(private authService: AuthenticationService, private fb: FormBuilder) { }

  ngOnInit(): void {

  }

onSubmit() {
  this.authService.executeJWTAuthenticationService(this.loginForm.value.mail, this.loginForm.value.password)
  .subscribe(
    response => {
      this.login = this.authService.getAuthenticatedUser();
      this.token = this.authService.getAuthenticatedToken();
      this.logged = true;
    }
  );
}


  logout() {
    this.authService.logout();
    this.login = this.authService.getAuthenticatedUser();
    this.token = this.authService.getAuthenticatedToken();
    this.logged = false;
  }



}
