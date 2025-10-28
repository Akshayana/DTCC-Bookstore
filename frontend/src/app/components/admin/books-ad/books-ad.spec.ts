import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BooksAd } from './books-ad';

describe('BooksAd', () => {
  let component: BooksAd;
  let fixture: ComponentFixture<BooksAd>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BooksAd]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BooksAd);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
