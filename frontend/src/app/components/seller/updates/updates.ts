import { Component, OnInit } from '@angular/core';
import { OrderService } from '../../../services/order.service';
import { TokenService } from '../../../services/token.service';
import { Order } from '../../../models/order.model';
import { OrderStatusDto } from '../../../models/orderstatus.model';
import { UserService } from '../../../services/user.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { OrderItemDto } from '../../../models/orderitemdto.model';

@Component({
  selector: 'app-updates',
  imports: [CommonModule, FormsModule],
  templateUrl: './updates.html',
  styleUrls: ['./updates.css'],
})
export class Updates implements OnInit {
  orders: Order[] = [];
  expandedOrders: { [key: number]: boolean } = {};
  sellerId: number = 0;

  constructor(
    private userService: UserService,
    private orderService: OrderService,
    private tokenService: TokenService
  ) {}

  ngOnInit(): void {
    const username = this.tokenService.getUsername();
    if (!username) return;

    this.userService.getUserIdByUsername(username).subscribe((id) => {
      this.sellerId = id;
      this.loadOrders();
    });
  }

  loadOrders() {
    this.orderService.getOrdersBySeller(this.sellerId).subscribe({
      next: (data: Order[]) => {
        this.orders = data.map((order) => ({ ...order, items: [] }));
      },
      error: (err) => console.error('Failed to load orders', err),
    });
  }

  toggleExpand(orderId: number) {
    this.expandedOrders[orderId] = !this.expandedOrders[orderId];

    if (this.expandedOrders[orderId]) {
      this.orderService.getOrderItems(orderId).subscribe({
        next: (items: OrderItemDto[]) => {
          const order = this.orders.find((o) => o.id === orderId);
          if (order) order.items = items || [];
        },
        error: (err) => console.error('Failed to load order items', err),
      });
    }
  }

  updateStatus(order: Order, status: string) {
    const dto: OrderStatusDto = {
      orderId: order.id,
      status: status.toUpperCase(),
    };

    this.orderService.updateOrderStatus(dto).subscribe({
      next: (res) => {
        alert(res);
        order.status = status.toUpperCase();
      },
      error: (err) => {
        console.error(err);
        alert('Failed to update status ');
      },
    });
  }
}
