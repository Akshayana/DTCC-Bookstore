import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Book } from '../models/book.model';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class BookService {
  private api = `${environment.apiUrl}/books`

  constructor(private http: HttpClient) {}

  getAllBooks(): Observable<Book[]> {
    return this.http.get<Book[]>(`${this.api}`);
  }

  getBooksByCategory(category: string): Observable<Book[]> {
    return this.http.get<Book[]>(`${this.api}/category/${category}`);
  }

  getBooksBySeller(sellerId: number): Observable<Book[]> {
    return this.http.get<Book[]>(`${this.api}/seller/${sellerId}`);
  }

  getCategories(): Observable<string[]> {
    return this.http.get<string[]>(`${this.api}/categories`);
  }

  getSellers(): Observable<{ id: number; name: string }[]> {
    return this.http.get<{ id: number; name: string }[]>(`${this.api}/sellers`);
  }

  addBook(book: Book): Observable<Book> {
    return this.http.post<Book>(`${this.api}`, book);
  }

  updateBook(id: number, data: any) {
    return this.http.put(`${this.api}/${id}`, data);
  }

  deleteBook(id: number): Observable<string> {
    return this.http.delete(`${this.api}/${id}`, { responseType: 'text' });
  }

  updateBookStock(data: any) {
    return this.http.put(`${this.api}/bookstock`, data, { responseType: 'text' });
  }
}
