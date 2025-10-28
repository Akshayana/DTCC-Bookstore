import { Component } from '@angular/core';
import { CartService } from '../../../services/cart.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-cart',
  imports: [FormsModule, CommonModule],
  templateUrl: './cart.html',
  styleUrl: './cart.css',
})
export class Cart {
  constructor(public cartService: CartService, private router: Router) {}

  proceedToCheckout() {
    this.router.navigate(['/customer/checkout']);
  }

  updateQty(item: any, change: number) {
    const newQty = item.quantity + change;
    if (newQty < 1) return;

    if (newQty > item.stockQuantity) {
      alert(`Only ${item.stockQuantity} copies of "${item.title}" available`);
      return;
    }

    item.quantity = newQty;
  }

  remove(id: number) {
    this.cartService.removeFromCart(id);
  }

  browseBooks() {
    this.router.navigate(['/customer/books']);
  }
}
