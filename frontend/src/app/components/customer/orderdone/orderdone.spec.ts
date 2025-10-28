import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Orderdone } from './orderdone';

describe('Orderdone', () => {
  let component: Orderdone;
  let fixture: ComponentFixture<Orderdone>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Orderdone]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Orderdone);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
