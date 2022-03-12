module {

public type Person = {
  name : Text;
  age : Nat;
};

let tom : Person = {
  name = "Tom Cruise";
  age = 59;
};

let tom_name = tom.name;
let tom_age = tom.age;

}