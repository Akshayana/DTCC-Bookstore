import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth.service';
import { TokenService } from '../../services/token.service';
import { LoginRequest } from '../../models/login.model';
import { RegisterRequest } from '../../models/register.model';
import { JwtResponse } from '../../models/jwtresponse.model';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.html',
  styleUrls: ['./auth.css'],
  standalone: true,
  imports: [CommonModule, FormsModule]
})
export class AuthComponent {

  isLogin: boolean = true;

  loginData: LoginRequest = { username: '', password: '' };
  registerData: RegisterRequest = { username: '', email: '', password: '', role: '' };

  constructor(
    private authService: AuthService,
    private tokenService: TokenService,
    private router: Router
  ) {}

  switchTab(tab: string) {
    this.isLogin = (tab === 'login');
  }

  onLogin() {
  this.authService.login(this.loginData).subscribe({
    next: (res: JwtResponse) => {
      this.tokenService.saveToken(res.token);
      this.tokenService.saveUserRole(res.role); 
      this.tokenService.saveUsername(res.username);
      console.log('Login successful', res);

      switch(res.role) {
        case 'ADMIN':
          this.router.navigate(['/admin']);
          break;
        case 'SELLER':
          this.router.navigate(['/seller']);
          break;
        case 'CUSTOMER':
          this.router.navigate(['/customer']);
          break;
        default:
          this.router.navigate(['/']);
      }
    },
    error: (err) => {
      console.error('Login failed', err);
      alert(err.error?.message || 'Login failed');
    }
  });
}


  onRegister() {
    this.authService.register(this.registerData).subscribe({
      next: (res) => {
        console.log('Registration successful', res);
        alert('Registration successful! Please login.');
        this.switchTab('login');
      },
      error: (err) => {
        console.error('Registration failed', err);
        alert(err.error?.message || 'Registration failed');
      }
    });
  }
}
