import { User } from './user.model';
import { OrderItemDto } from './orderitemdto.model';

export interface Order {
  id: number;
  orderDate: string;
  status: string;
  total_Amount?: number;
  customer?: User[];
  items?: OrderItemDto[]
}
