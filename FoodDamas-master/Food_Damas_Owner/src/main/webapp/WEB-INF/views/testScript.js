/**
 * Created by Mr_Quang on 9/5/2016.
 */
//Tao Doi tuong
var UserObject ={
    //thuoc tinh
    userID : "MrDavid",
    userName :""
};

UserObject.getuserID = function()
{
    console.log(this.userID);
};

//Cach 2
// Khởi tạo
var Comment = {};

// Thêm thuộc tính
Comment.title = '';
Comment.content = '';
Comment.fullname = '';
Comment.email = '';

UserObject.getuserID();

//tao object with constructor
function person(name,age){
    this.name = name;
    this.age = age;
    this.printInfo = function(){
        console.log(this.lastname+" , "+this.name +" , "+this.age);
    }
    this.changeName = function (name) {
        this.name = name;
    };
}
//tao thuoc tinh cho toan bo object la con cua prototype
// ma khong tao gia tri mac dinh
person.lastname = "Nghiem";
//tao thuoc tinh cho toan bo object la con cua prototype
// va gan gia tri mac dinh
person.prototype.habbit ="listen to music";

var student = new person("Quang",23);
student.eye ="brown";
student.printInfo();


student.score = 100;
for(x in student){
    console.log(x +" : "+student[x]);
}
delete student.eye;

student.changeName("David Quang");
for(x in student){
    console.log(x +" : "+student[x]);
}

/*
function car(name,brand){
    info:
    {
        this.brand ="BMW",
        this.name ="Car 1"
    }
    func:
    {
        this.getCarName = function()
        {
            return this.name;
        },
        getCarBrand = function(){
            return this.brand;
        }

    }
}
var car1 = new car();
console.log(car1.info.name);
console.log(car1.func.getCarName());
console.log(car1.func.getCarBrand());*/

function userVO(){
    //private
    var userid;
    var userpassword;
    //public
    this.setID =function(id){
        userid =id;
    }
    this.getID = function(){
        return userid;
    }
}
var user1 = new userVO();
user1.setID("Quang");
console.log(user1.getID());