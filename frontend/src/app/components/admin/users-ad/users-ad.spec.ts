import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UsersAd } from './users-ad';

describe('UsersAd', () => {
  let component: UsersAd;
  let fixture: ComponentFixture<UsersAd>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [UsersAd]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UsersAd);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
