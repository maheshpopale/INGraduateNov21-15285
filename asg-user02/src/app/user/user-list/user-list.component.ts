import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/user.service';
import { IUser } from '../IUser';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {

  users:IUser[]=[];
  constructor(private userService:UserService) { }

  ngOnInit(): void {
    this.getUsers();
  }

  getUsers(){
  
    this.userService.getUsers().subscribe(data=>{
      this.users=data;
    })    
    
  }
}
