import Nat8 "mo:base/Nat8";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
actor {
//challenge 1
    public func nat_to_nat8 (n : Nat) : async Nat8 {
      if (n <= 255 ) {
      let nat8 = Nat8.fromNat(n); 
      return nat8;
      } else {
          return 0;
      }
    };
//challenge 2
public func max_number_with_n_bits(n: Nat): async Text {
        return Nat.toText(2 ** n - 1);

    };

    //challenge 3
    
};