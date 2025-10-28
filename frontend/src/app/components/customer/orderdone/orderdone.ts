import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-orderdone',
  imports: [],
  templateUrl: './orderdone.html',
  styleUrl: './orderdone.css',
})
export class Orderdone {
  constructor(private router: Router) {}
  submit() {
    alert('Order placed!');
  }

  continueShopping() {
    this.router.navigate(['/customer/books']);
  }
}
