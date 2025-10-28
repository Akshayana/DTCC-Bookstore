import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { TokenService } from '../../services/token.service';
import { UserService } from '../../services/user.service';
import { User } from '../../models/user.model';

@Component({
  selector: 'app-customer',
  standalone: true,
  imports: [FormsModule, CommonModule, RouterModule],
  templateUrl: './customer.html',
  styleUrls: ['./customer.css'],
})
export class Customer implements OnInit {
  username: string | null = '';
  userRole: string | null = '';
  showProfileModal: boolean = false;
  editMode: boolean = false;

  editUser: User & { existingPassword?: string } = {
    id: 0,
    username: '',
    email: '',
    password: '',
    role: { id: 0, name: '' },
    existingPassword: '',
  };

  tabs = [
    { label: 'Browse Books', route: '/customer/books', icon: 'bi-grid-3x3-gap' },
    { label: 'My Cart', route: '/customer/cart', icon: 'bi-cart' },
  ];

  constructor(
    private tokenService: TokenService,
    private router: Router,
    private userService: UserService
  ) {}

  ngOnInit(): void {
    this.username = this.tokenService.getUsername();
    this.userRole = this.tokenService.getUserRole();
  }

  onLogout() {
    this.tokenService.logout();
    this.router.navigate(['/auth']);
  }

  openProfileModal() {
    const username = this.tokenService.getUsername();
    if (!username) {
      alert('Username not found.');
      return;
    }

    this.userService.getUserIdByUsername(username).subscribe({
      next: (userId) => {
        this.userService.getUserById(userId).subscribe({
          next: (userData) => {
            this.editUser = {
              ...userData,
              password: '',
              existingPassword: userData.password, 
              role: userData.role,
            };
            this.showProfileModal = true;
            this.editMode = true;
          },
          error: (err) => {
            console.error(err);
            alert('Failed to load user details.');
          },
        });
      },
      error: (err) => {
        console.error(err);
        alert('Failed to get user ID.');
      },
    });
  }

  closeProfileModal() {
    this.showProfileModal = false;
    this.editMode = false;
    this.editUser.password = '';
  }

  toggleEditMode() {
    this.editMode = !this.editMode;
    if (!this.editMode) this.editUser.password = '';
  }

  updateUser() {
    const userToUpdate: any = {
      username: this.editUser.username,
      email: this.editUser.email,
      role: { id: this.editUser.role.id },
      password: this.editUser.password?.trim()
        ? this.editUser.password
        : this.editUser.existingPassword, 
    };

    this.userService.updateUser(this.editUser.id, userToUpdate).subscribe({
      next: (updated) => {
        alert('Profile updated successfully!');
        this.username = updated.username;
        this.userRole = this.tokenService.getUserRole();
        localStorage.setItem(
          'user',
          JSON.stringify({ ...updated, role: this.userRole })
        );
        this.closeProfileModal();
      },
      error: (err) => {
        console.error(err);
        alert('Failed to update profile.');
      },
    });
  }
}
