import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BooksSel } from './books-sel';

describe('BooksSel', () => {
  let component: BooksSel;
  let fixture: ComponentFixture<BooksSel>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BooksSel]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BooksSel);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
