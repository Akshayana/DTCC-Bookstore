import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { TokenService } from '../services/token.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private tokenService: TokenService, private router: Router) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    const token = this.tokenService.getToken();
    const userRole = this.tokenService.getUserRole();
    const expectedRoles = route.data['roles'] as Array<string>;

    if (token && userRole && expectedRoles.includes(userRole)) {
      return true;
    }

    this.router.navigate(['/auth']);
    return false;
  }
}
