theory Tuple_Array imports "../Hex" "../AbiTypes" "../AbiTypesSyntax" "../AbiDecode"

begin

(* solidity *)

(*


 pragma experimental ABIEncoderV2;

 contract C {
    struct arrs {
    uint256 [] a1;
    uint256 [] a2;
    uint256 [] a3;
}
    arrs x;   
    function getEncoding() external returns (bytes memory) {
        
        x.a1.push(uint256(1));
        x.a1.push(uint256(2));
        x.a2.push(uint256(51));
        x.a2.push(uint256(52));
        x.a2.push(uint256(53));

        return abi.encode(x);
    }
}

*)

(* hex output (raw) *)

(*

{
	"0": "bytes: 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000033000000000000000000000000000000000000000000000000000000000000003400000000000000000000000000000000000000000000000000000000000000350000000000000000000000000000000000000000000000000000000000000000"
}

*)

(* hex output (trimmed) *)

(*
000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000033000000000000000000000000000000000000000000000000000000000000003400000000000000000000000000000000000000000000000000000000000000350000000000000000000000000000000000000000000000000000000000000000
*)

definition test_in :: "8 word list" where
"test_in = hex_splits
''000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000030000000000000000000000000000000000000000000000000000000000000033000000000000000000000000000000000000000000000000000000000000003400000000000000000000000000000000000000000000000000000000000000350000000000000000000000000000000000000000000000000000000000000000''"

definition test_schema :: abi_type where
"test_schema = ABI_TYPE\<guillemotleft>(uint256 [], uint256 [], uint256 [])\<guillemotright>"

definition test_out :: abi_value where
"test_out = Vtuple [Tarray (Tuint 256), Tarray (Tuint 256), Tarray (Tuint 256)]
                   [Varray (Tuint 256) (map (Vuint 256) [1, 2]),
                    Varray (Tuint 256) (map (Vuint 256) [51, 52, 53]),
                    Varray (Tuint 256) []
                   ]"

value "test_out"

value "abi_get_type test_out"

value "decode test_schema test_in"

end