export interface Book {
  id?: number;
  title: string;
  author: string;
  price?: number;
  category: string;
  stockQuantity?: number;
  imageUrl?: string;
  sellerId?: number;
}
