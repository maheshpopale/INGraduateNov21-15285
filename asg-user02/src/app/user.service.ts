import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IUser } from './user/IUser';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http:HttpClient) { }

  private url='http://localhost:3000/users/';
   
   getUsers():Observable<IUser[]>
   {
     return this.http.get<IUser[]>(this.url);
   }       

}


