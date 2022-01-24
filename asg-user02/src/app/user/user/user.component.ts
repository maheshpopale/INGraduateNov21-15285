import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { map } from 'rxjs';
import { UserService } from 'src/app/user.service';
import { IUser } from '../IUser';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
  id!: number;
  user:IUser={id:0,name:""}

  constructor(private userService:UserService,private activatedroute:ActivatedRoute) { }

  ngOnInit(): void {
   this.activatedroute.params.subscribe(
    (params: Params) => {
      this.id =+params["id"]
    //   console.log(this.id);
    //  console.log(this.id);
  });
  this.getUser(this.id);
  console.log(this.id);
}
  getUser(id:number){
    this.userService.getUser(id).subscribe(data=>{
      console.log(data);
    })
        
    }
} 

