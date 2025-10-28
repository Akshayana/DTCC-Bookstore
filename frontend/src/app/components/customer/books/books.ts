import { Component, OnInit } from '@angular/core';
import { BookService } from '../../../services/book.service';
import { CartService } from '../../../services/cart.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-books',
  imports: [FormsModule, CommonModule],
  templateUrl: './books.html',
  styleUrls: ['./books.css'],
})
export class Books implements OnInit {
  books: any[] = [];
  allBooks: any[] = [];
  categories: string[] = [];
  sellers: any[] = [];
  searchKeyword: string = '';
  selectedCategory: string = '';
  selectedSeller: string = '';

  readonly Math = Math;

  constructor(private bookService: BookService, private cartService: CartService) {}

  ngOnInit(): void {
    this.loadAllBooks();
    this.bookService.getCategories().subscribe({
      next: (data) => (this.categories = data),
      error: (err) => console.error('Categories load failed', err),
    });

    this.bookService.getSellers().subscribe({
      next: (data) => (this.sellers = data),
      error: (err) => console.error('Sellers load failed', err),
    });
  }

  loadAllBooks() {
    this.bookService.getAllBooks().subscribe((data) => {
      this.allBooks = data.map((b) => ({ ...b, qty: 1 }));
      this.syncQuantities();
    });
  }
  syncQuantities() {
    this.books = this.allBooks.map((b) => {
      const cartItem = this.cartService.getCartItems().find((ci) => ci.bookId === b.id);
      return { ...b, qty: cartItem ? cartItem.quantity : 1 };
    });
  }

  filterByCategory(category: string) {
    this.selectedCategory = category;
    if (!category) {
      this.loadAllBooks();
      return;
    }
    this.bookService.getBooksByCategory(category).subscribe((data) => {
      this.books = data;
    });
  }

  filterBySeller(sellerId: string) {
    this.selectedSeller = sellerId;
    if (!sellerId) {
      this.loadAllBooks();
      return;
    }
    this.bookService.getBooksBySeller(Number(sellerId)).subscribe((data) => {
      this.books = data;
    });
  }

  onSearchChange() {
    const keyword = this.searchKeyword.trim().toLowerCase();

    if (keyword === '') {
      this.syncQuantities();
      return;
    }

    this.books = this.allBooks.filter(
      (b) => b.title.toLowerCase().includes(keyword) || b.author.toLowerCase().includes(keyword)
    );
  }

  addToCart(book: any, qty: number) {
    if (book.stockQuantity <= 0) {
      alert(`"${book.title}" is currently unavailable ❌`);
      return;
    }

    if (qty > book.stockQuantity) {
      alert(`Only ${book.stockQuantity} copies available`);
      return;
    }

    this.cartService.addToCart(book, qty);
    alert(`"${book.title}" (${qty}) added to cart! ✅`);
  }

  adjustQty(b: any, change: number) {
    b.qty = (b.qty || 1) + change;
    if (b.qty < 1) b.qty = 1;
  }
}
