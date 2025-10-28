import { Injectable } from '@angular/core';

export interface CartItem {
  bookId: number;
  title: string;
  price: number;
  quantity: number;
}

@Injectable({
  providedIn: 'root',
})
export class CartService {
  private items: CartItem[] = [];

  getCartItems(): CartItem[] {
    return this.items;
  }

  addToCart(book: any, qty: number = 1) {
    const existing = this.items.find((i) => i.bookId === book.id);

    if (existing) {
      existing.quantity += qty;
    } else {
      this.items.push({
        bookId: book.id,
        title: book.title,
        price: book.price,
        quantity: qty,
      });
    }
  }

  removeFromCart(bookId: number) {
    this.items = this.items.filter((i) => i.bookId !== bookId);
  }

  clearCart() {
    this.items = [];
  }

  getTotalAmount(): number {
    return this.items.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }
}
