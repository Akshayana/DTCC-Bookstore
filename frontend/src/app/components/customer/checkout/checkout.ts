import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../../../services/cart.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { OrderService } from '../../../services/order.service';
import { HttpClient } from '@angular/common/http';
import { TokenService } from '../../../services/token.service';
import { UserService } from '../../../services/user.service';

@Component({
  selector: 'app-checkout',
  imports: [FormsModule, CommonModule],
  templateUrl: './checkout.html',
  styleUrl: './checkout.css',
})
export class Checkout {
  address = {
    house: '',
    street: '',
    area: '',
    zip: '',
    state: '',
    country: '',
  };

  constructor(
    private router: Router,
    private cartService: CartService,
    private orderService: OrderService,
    private userService: UserService,
    private tokenService: TokenService
  ) {}

  placeOrder() {
    const username = this.tokenService.getUsername();
    if (!username) {
      alert('User not logged in!');
      return;
    }

    this.userService.getUserIdByUsername(username).subscribe({
      next: (userId) => {
        if (!userId) {
          alert('Failed to retrieve user ID');
          return;
        }

        const items = this.cartService.getCartItems().map((item) => ({
          bookId: item.bookId,
          quantity: item.quantity,
        }));

        if (items.length === 0) {
          alert('Cart is empty!');
          return;
        }

        this.orderService.placeOrder(userId, items).subscribe({
          next: (response) => {
            console.log('Order Placed Successfully:', response);
            this.cartService.clearCart(); // clear cart only after success
            this.router.navigate(['/customer/orderdone']);
          },
          error: (err) => {
            console.error('Order failed:', err);
            alert('Order Failed: ' + (err.error?.message || err.message));
          },
        });
      },
      error: (err) => {
        console.error('Failed to fetch user ID:', err);
        alert('Failed to fetch user ID');
      },
    });
  }
}
