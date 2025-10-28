import { Component, OnInit } from '@angular/core';
import { BookService } from '../../../services/book.service';
import { Book } from '../../../models/book.model';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-books-ad',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './books-ad.html',
  styleUrls: ['./books-ad.css'],
})
export class BooksAd implements OnInit {
  books: Book[] = [];
  allBooks: any[] = [];
  categories: string[] = [];
  sellers: any[] = [];
  searchKeyword: string = '';
  selectedCategory: string = '';
  selectedSeller: string = '';
  showAddModal: boolean = false;
  newBook: Book = {
    title: '',
    author: '',
    category: '',
    price: undefined,
    stockQuantity: undefined,
    imageUrl: '',
    sellerId: undefined,
  };

  constructor(private bookService: BookService) {}

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
    this.bookService.getAllBooks().subscribe({
      next: (data) => {
        this.books = data;
        this.allBooks = data;
      },
      error: (err) => console.error('Failed to load books', err),
    });
  }

  filterByCategory(category: string) {
    this.selectedCategory = category;

    if (!category) {
      this.books = [...this.allBooks];
      return;
    }

    this.books = this.allBooks.filter((b) => b.category === category);
  }

  filterBySeller(sellerId: string) {
    this.selectedSeller = sellerId;

    if (!sellerId) {
      this.books = [...this.allBooks];
      return;
    }

    this.books = this.allBooks.filter((b) => b.sellerId == Number(sellerId));
  }

  onSearchChange() {
    const keyword = this.searchKeyword.trim().toLowerCase();

    if (!keyword) {
      this.books = [...this.allBooks];
      return;
    }

    this.books = this.allBooks.filter(
      (b) => b.title.toLowerCase().includes(keyword) || b.author.toLowerCase().includes(keyword)
    );
  }

  openAddModal() {
    this.showAddModal = true;
  }

  closeAddModal() {
    this.showAddModal = false;
    this.newBook = {
      title: '',
      author: '',
      category: '',
      price: undefined,
      stockQuantity: undefined,
      imageUrl: '',
      sellerId: undefined,
    };
  }

  addBook() {
    this.bookService.addBook(this.newBook).subscribe({
      next: (book) => {
        alert('Book added successfully!');
        this.books.push(book);
        this.closeAddModal();
      },
      error: (err) => {
        console.error(err);
        alert('Failed to add book.');
      },
    });
  }

  deleteBook(bookId: number) {
    if (!confirm('Are you sure you want to delete this book?')) return;

    this.bookService.deleteBook(bookId).subscribe({
      next: (res) => {
        alert(res);
        this.books = this.books.filter((b) => b.id !== bookId);
      },
      error: (err) => {
        console.error('Failed to delete book', err);
        alert('Failed to delete book. See console.');
      },
    });
  }
}
