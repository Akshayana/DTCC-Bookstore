import { Routes } from '@angular/router';
import {  NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { AuthComponent } from './components/auth/auth';
import { AuthGuard } from './guards/auth-guard';
import { Admin } from './components/admin/admin';
import { Customer } from './components/customer/customer';
import { Books } from './components/customer/books/books';
import { Cart } from './components/customer/cart/cart';
import { Checkout } from './components/customer/checkout/checkout';
import { Orderdone } from './components/customer/orderdone/orderdone';
import { BooksSel } from './components/seller/books-sel/books-sel';
import { Updates } from './components/seller/updates/updates';
import { Seller } from './components/seller/seller';
import { BooksAd } from './components/admin/books-ad/books-ad';
import { UsersAd } from './components/admin/users-ad/users-ad';

export const routes: Routes = [
  { path: '', redirectTo: '/auth', pathMatch: 'full' },
  { path: 'auth', component: AuthComponent },
  {
    path: 'admin',
    component: Admin,
    canActivate: [AuthGuard],
    data: { roles: ['ADMIN'] },
    children: [
    { path: '', redirectTo: 'books-ad', pathMatch: 'full' },
    { path: 'books-ad', component: BooksAd},
    { path: 'users-ad', component: UsersAd }
    ]
  },
  {
    path: 'seller',
    component: Seller,
    canActivate: [AuthGuard],
    data: { roles: ['SELLER'] },
    children: [
    { path: '', redirectTo: 'books-sel', pathMatch: 'full' },
    { path: 'books-sel', component: BooksSel},
    { path: 'updates', component: Updates }
    ]
  },
  {
  path: 'customer',
  component: Customer,
  canActivate: [AuthGuard],
  data: { roles: ['CUSTOMER'] },
  children: [
    { path: '', redirectTo: 'books', pathMatch: 'full' },
    { path: 'books', component: Books },
    { path: 'cart', component: Cart },
    { path: 'checkout', component: Checkout },
    { path: 'orderdone', component: Orderdone }
  ]
},
  { path: '**', redirectTo: '/auth' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
