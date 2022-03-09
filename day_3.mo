//not working : 1, 10
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Array "mo:base/Array";
import Nat "mo:base/Nat";
actor {
    //Challenge 1 Write a private function swap that takes 3 parameters : a mutable array , an index j and an index i 
    //and returns the same array but where value at index i and index j have been swapped.
    //neither work, missing something in .dfx?
       private func swap<T>(a : [T], j: Nat, i: Nat ) : [T] {
        let b : [var T] = Array.thaw<T>(a);
        let temp : T = b[j];
        b[j] := b[i];
        b[i] := temp;
        Array.freeze<T>(b);
    };

    private func swap2(array : [var Nat], j : Nat, i : Nat) : [var Nat]{
     let a : [var Nat] = [var 1, 3];
     a[1] := j;
     a[3] := i;
    return a;
 };

 func swap3<T>(arr: [var T], i: Nat, j: Nat): [var T] {
        let temp = arr[i];
        arr[i] := arr[j];
        arr[j] := temp;

        return arr;
    };

    func _swap<T>(arr: [var T], i: Nat, j: Nat): [var T] {
        let temp = arr[i];
        arr[i] := arr[j];
        arr[j] := temp;

        return arr;
    };

    //challenge 2 Write a function init_count that takes a Nat n and returns an array [Nat] where value is equal to it's corresponding index.
    //example run: dfx canister call day_3 init_count '(11)'
     public func init_count(n: Nat) : async [Nat] {
        Array.tabulate<Nat>(n, func(i: Nat) {return i})
    };

    //challenge 3 Write a function seven that takes an array [Nat] and returns "Seven is found" if one digit of ANY number is 7. 
    //Otherwise this function will return "Seven not found".
    //example run: dfx canister call day_3 seven ' (vec {11;21;90;7}) '
    
     public func seven(a: [Nat]) : async Text {
        let hasSeven : ?Nat = Array.find<Nat>(a, func(val: Nat) {return val == 7});
        switch(hasSeven) {
            case(null) {
                return "Seven not found";
            };
            case(?val){
                return "Seven is found";
            };
        };
    };
    
    //challenge 4 Challenge 4 : Write a function nat_opt_to_nat that takes two parameters : n of type ?Nat 
    //and m of type Nat . This function will return the value of n if n is not null and if n is null 
    //it will default to the value of m.
    //example run: dfx canister call day_3 nat_opt_to_nat '(opt 9, 8)'
    
    public func nat_opt_to_nat(n: ?Nat, m: Nat) : async Nat {
        switch(n) {
            case(null) {
                return m;
            };
            case(?val){
                return val;
            };
        };
    };
 //Challenge 5 : Write a function day_of_the_week that takes a Nat n and returns a Text value corresponding to the day.
 //example run: dfx canister call day_3 day_of_the_week '(7)'
 public func day_of_the_week(n: Nat) : async ?Text {
        switch(n) {
            case 1 ?"Monday";
            case 2 ?"Tuesday";
            case 3 ?"Wednesday";
            case 4 ?"Thursday";
            case 5 ?"Friday";
            case 6 ?"Saturday";
            case 7 ?"Sunday";
            case other null;
        }
    };

    //challenge 6 Write a function populate_array that takes an array [?Nat] and returns an array [Nat] where all null values have been replaced by 0.
    //example run: dfx canister call day_3 populate_array ' (vec {opt 11;null; opt 21; null; opt 90; opt 54}) ' 
    public func populate_array(a: [?Nat]) : async [Nat] {
        Array.map<?Nat, Nat>(
            a, 
            func(val: ?Nat) {
                switch(val) {
                    case null 0; 
                    case (?nat) nat;
                }
            });
    };
    //challenge 7  Write a function sum_of_array that takes an array [Nat] and returns the sum of a values in the array.
    //example run: dfx canister call day_3 sum_of_array ' (vec {19;7;8}) '
    public func sum_of_array(a: [Nat]) : async Nat {
        Array.foldLeft<Nat, Nat>(a, 0, func(n: Nat, m: Nat) {n+m});
    };


//challenge 8 Write a function squared_array that takes an array [Nat] and returns a new array where each value has been squared.
//example run: dfx canister call day_3 squared_array ' (vec {19;7;8}) '
 public func squared_array(a: [Nat]) : async [Nat] {
        Array.map<Nat, Nat>(a, func(val: Nat){val**2});
    };

//challenge 9 Write a function increase_by_index that takes an array [Nat] and returns a new array where each number has been increased 
//by it's corresponding index.
//example run: dfx canister call day_3 increase_by_index ' (vec {9;70;80}) ' it increase 0 to first, 1 to second, 2 to third etc? i think thats right
public func increase_by_index(a: [Nat]) : async [Nat] {
        Array.mapEntries<Nat, Nat>(a, func(val: Nat, i: Nat){val+i});
    };

//challenge 10 Write a higher order function contains<A> that takes 3 parameters : an array [A] , a of type A and a function f that takes a tuple 
//of type (A,A) and returns a boolean. This function should return a boolean indicating whether or not a is present in the array.
//example run: dont know syntax or how to call function 
func contains<A>(array: [A], a: A, f: (A, A) -> Bool) : async Bool {
        switch(Array.find<A>(array, func(val: A){f(val, a)})) {
            case null false;
            case (?_) true;
        }
    };
};
