import { Component, OnInit } from '@angular/core';
import { UserService } from '../../../services/user.service';
import { User } from '../../../models/user.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-users-ad',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './users-ad.html',
  styleUrls: ['./users-ad.css'],
})
export class UsersAd implements OnInit {
  users: User[] = [];

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers() {
    this.userService.getAllUsers().subscribe({
      next: (data) => (this.users = data),
      error: (err) => console.error('Failed to load users', err),
    });
  }

  deleteUser(userId: number) {
    if (!confirm('Are you sure you want to delete this user?')) return;
    this.userService.deleteUser(userId).subscribe({
      next: () => {
        alert('User deleted successfully!');
        this.users = this.users.filter((u) => u.id !== userId);
      },
      error: (err) => console.error('Failed to delete user', err),
    });
  }
}
