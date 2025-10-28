import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { OrderItemDto } from '../models/orderitemdto.model';
import { OrderStatusDto } from '../models/orderstatus.model';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class OrderService {

  private api = `${environment.apiUrl}/orders`;

  constructor(private http: HttpClient) {}

  placeOrder(userId: number, items: OrderItemDto[]): Observable<any> {
  return this.http.post(`${this.api}/place?userId=${userId}`, items);
}

  updateOrderStatus(data: OrderStatusDto): Observable<any> {
  return this.http.put(`${this.api}/orderstatus`, data, { responseType: 'text' as 'json' });
}

   getOrdersBySeller(sellerId: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.api}/seller/${sellerId}`);
  }

  getOrderItems(orderId: number): Observable<any[]> {
  return this.http.get<any[]>(`${this.api}/${orderId}/items`);
}

}
