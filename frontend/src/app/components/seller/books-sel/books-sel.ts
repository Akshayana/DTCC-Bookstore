import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BookService } from '../../../services/book.service';
import { TokenService } from '../../../services/token.service';
import { UserService } from '../../../services/user.service';

@Component({
  selector: 'app-books-sel',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './books-sel.html',
  styleUrls: ['./books-sel.css'],
})
export class BooksSel implements OnInit {
  books: any[] = [];
  sellerId: number = 0;

  constructor(
    private bookService: BookService,
    private tokenService: TokenService,
    private userService: UserService
  ) {}

  ngOnInit(): void {
    const username = this.tokenService.getUsername();
    if (!username) return;

    this.userService.getUserIdByUsername(username).subscribe((id: number) => {
      this.sellerId = id;
      this.loadBooks();
    });
  }

  loadBooks() {
    this.bookService.getBooksBySeller(this.sellerId).subscribe((res: any[]) => {
      this.books = res;
    });
  }

  updateStock(book: any) {
    if (book.stockQuantity < 0) {
      alert('Stock cannot be negative.');
      return;
    }

    const payload = {
      bookId: book.id,
      stockQuantity: book.stockQuantity,
    };

    this.bookService.updateBookStock(payload).subscribe({
  next: (res) => {
    alert(res); 
    this.loadBooks();
  },
  error: (err) => {
    console.error(err);
    alert('Stock update failed ');
  },
});

  }

  updateBook(book: any) {
  const payload = {
    title: book.title,
    author: book.author,
    category: book.category,
    price: book.price,
    imageUrl: book.imageUrl,
    sellerId: this.sellerId, 
  };

  this.bookService.updateBook(book.id, payload).subscribe({
    next: (res) => {
      alert('Book details updated ');
      this.loadBooks();
    },
    error: () => alert('Update failed '),
  });
}

}
