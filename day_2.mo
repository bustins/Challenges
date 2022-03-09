import Nat8 "mo:base/Nat8";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Blob "mo:base/Blob";
import Array "mo:base/Array";
import HashMap "mo:base/HashMap";

actor {

//challenge 1  Write a function nat_to_nat8 that converts a Nat n to a Nat8. Make sure that your function never trap.
//example run: dfx canister call day_2 nat_to_nat8 '(255)'
    public func nat_to_nat8 (n : Nat) : async Nat8 {
      if (n <= 255 ) {
      let nat8 = Nat8.fromNat(n); 
      return nat8;
      } else {
          return 0;
      }
    };

//challenge 2 Write a function max_number_with_n_bits that takes a Nat n and returns the maximum number than can be represented with only n-bits.
//example run: dfx canister call day_2 max_number_with_n_bits '(5)' not sure which is write, should be text or nat?
public func max_number_with_n_bits(n: Nat): async Text {
        return Nat.toText(2 ** n - 1);

    };

public func max_number_with_n_bits2(n: Nat8): async Nat {
        var as_nat: Nat = Nat8.toNat(n);

        return(2 ** as_nat) - 1;
    };

    //challenge 3 convert decimal numbers to bits Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding
    // to the binary representation of this number.
    //example run: dfx canister call day_2 decimal_to_bits '(255)' -> "11111111".
    public func decimal_to_bits(a : Nat) : async Text {
        var binary : Text = "";
        var mutableNat : Nat = a;
        while (mutableNat > 0) {
            binary := Nat.toText(mutableNat%2) # binary;
            mutableNat /= 2;
        };
        binary;
    };

    //challenge 4 capitalize char ASCII
    //example run:  dfx canister call day_2 capitalize_character '(097)' 
    public func capitalize_character(a : Char) : async Char {
        Char.fromNat32(Char.toNat32(a) - 32);
    };

    //challenge 5 capitalize text
    //example run: dfx canister call day_2 capitalize_text '("alien")'
   public func capitalize_text(a : Text) : async Text {
        var capText : Text = "";
        for (c in a.chars()) {
            if (Char.isUppercase(c)) {
                capText #= Char.toText(c);
            } else {
                capText #= Char.toText(Char.fromNat32(Char.toNat32(c) -32));
            };
        };
        capText;
    };
//challenge 6 Write a function is_inside that takes two arguments : a Text t and a Char c and returns a Bool indicating if c is inside t .
//example run: dfx canister call day_2 is_inside '("a",097)' both work
   public func is_inside(a: Text, b: Char) : async Bool {
        for (c in a.chars()) {
            if (b == c) {
                return true;
            };
        };
        return false;
    };

     public func is_inside2(t: Text, c: Char): async Bool{

        for (char in t.chars()){
            if (c == char){
                return true;
            };
        };

        return false;
    };

    //challenge 7 Write a function trim_whitespace that takes a text t and returns the trimmed version of t.
    //example run: dfx canister call day_2 trim_whitespace '("      Alien   ")'
     public func trim_whitespace(a: Text) : async Text {
        Text.trim(a, #char ' ');
    };

    //challenge 8 Write a function duplicated_character that takes a Text t and returns the first duplicated character in t converted to Text.
    //example run: dfx canister call day_2 duplicated_character '("Hello")' 
    public func duplicated_character(t: Text): async Text{
        let n = t.size();

        var map = HashMap.HashMap<Char, Char>(
                    n, 
                    func (c1 : Char, c2 : Char) : Bool  = c1 == c2, 
                    Char.toNat32
                    );

        for (c in t.chars()){
            switch ( map.get(c)) {
                case (?char) return Char.toText(char);
                case (_) map.put(c, c);
            };
        };

        return t;
    };

    //challenge 9 Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.
    //example run: dfx canister call day_2 size_in_bytes '("Word")' both work
     public query func size_in_bytes(a: Text) : async Nat {
        var b : Blob = Text.encodeUtf8(a);
        Blob.toArray(b).size();
    }; 

public query func size_in_bytes2(t: Text):  async Nat{
        Text.encodeUtf8(t).size()
    };

    //challenge 10 bubble sort array
    //example run: dfx canister call day_2 bubble_sort  ' (vec {11;21;90;54;7;8}) '
     public func bubble_sort(a: [Nat]) : async [Nat] {
        var mutableArray : [var Nat] = Array.thaw(a);
        for (i in Iter.range(0, mutableArray.size()-2)) {
            for (j in Iter.range(0, mutableArray.size()-2-i)) {
                if (mutableArray[j] > mutableArray[j+1]) {
                    var temp : Nat = mutableArray[j];
                    mutableArray[j] := mutableArray[j+1];
                    mutableArray[j+1] := temp;
                };
            };
        };
        Array.freeze(mutableArray);
    };

};