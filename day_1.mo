import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Iter "mo:base/Iter";

actor {
    //Challenge 1
    public func add(n : Nat, m : Nat) : async Nat {
        return(n + m);
    };

    //Challenge 2
    public func square(n : Nat) : async Nat {
        return(n * n);
    };

    //Challenge 3
    public func days_to_second(n : Nat) : async Nat {
        return(n * 86400);
    };

    //Challenge 4
    var counter : Nat = 0;

    public func increment_counter(n : Nat) : async Nat {
        counter := counter + n;
        return(counter);
    };

    public func clear_counter() : async () {
        counter := 0;
        return;
    };

    //Challenge 5
    let a : Bool = true;
    let b : Bool = false;

// Division operator : 7 / 2 = 3;
//modulo operator : 7 % 2 = 1;

    public func div(n : Nat, m : Nat) : async Nat {
        return(n / m);
    };

    public func mod(n : Nat, m : Nat) : async Nat {
        return(n % m)
    };
    public func test_equal(n : Nat, m : Nat) : async Bool {
        if(n == m) {
            return(true);
        } else {
            return(false);
        }       
    };

    public func divide(n : Nat, m : Nat) : async Bool {
        let remainder = n % m;
        if(remainder == 0) {
            return true;
        } else {
        return false;
        }
    };

    //challenge 6
     public func is_even(n : Nat) : async Bool {
        if(n % 2 == 0) {
            return (true);
        } else {
            return (false);
        }
    };
    
    //challenge 7
   public func sum_of_array(array : [Nat]) : async Nat {
        var sum : Nat = 0;
        for (value in array.vals()) {
            sum := sum + value;
        };
        return sum;
    };

    //challenge 8
    public func maximum(array : [Nat]) : async Nat {
        if(array.size() == 0) return 0;
        var maximum = array[0];
        for (val in array.vals()){
            if (val >= maximum) {
                maximum := val;
            };
        };
        return(maximum)
    };

    //challenge 9
    public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
        var new_array : [Nat] = [];
        for (vals in array.vals()){
            if(vals != n){
                new_array := Array.append<Nat>(new_array, [vals]);
            };
        };
        return(new_array);
    };

    //challenge 10
    
};