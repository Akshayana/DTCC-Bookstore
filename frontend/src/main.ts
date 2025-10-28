
import { bootstrapApplication } from '@angular/platform-browser';
import { App } from './app/app';
import { provideHttpClient } from '@angular/common/http';
import { provideRouter } from '@angular/router';
import { routes } from './app/app.routes';
import { withInterceptors } from '@angular/common/http';
import { jwtInterceptor } from './app/interceptors/jwt-interceptor';


bootstrapApplication(App, {
  providers: [
    provideHttpClient(withInterceptors([jwtInterceptor])),
    provideRouter(routes)
  ]
})
.catch(err => console.error(err));
