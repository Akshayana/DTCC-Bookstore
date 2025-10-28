import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../models/user.model';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private api = `${environment.apiUrl}/users`;

  constructor(private http: HttpClient) {}

  getAllUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${this.api}`);
  }

  getUserById(id: number): Observable<User> {
    return this.http.get<User>(`${this.api}/${id}`);
  }

  getUserIdByUsername(username: string): Observable<number> {
    return this.http.get<number>(`${this.api}/userid/${username}`);
  }

  updateUser(id: number, data: User): Observable<User> {
    return this.http.put<User>(`${this.api}/${id}`, data);
  }

  deleteUser(id: number): Observable<string> {
    return this.http.delete(`${this.api}/${id}`, { responseType: 'text' });
  }
}
