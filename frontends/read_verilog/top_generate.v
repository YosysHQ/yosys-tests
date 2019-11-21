module top (
input [3:0] S,
input [15:0] D,
output M2,M4,M8,M16
);
parameter u = 0;

genvar index;
generate
for (index=0; index < 8; index=index+1)
  begin: gen_code_label
  end
endgenerate

genvar index;
generate
case( u )
       0 : begin end
       1 : begin end
       2 : begin end
       3 : begin end
   endcase
endgenerate

// reg angle;
// case (index)
// //Create the case statement
// 	1 :
// 	begin
//     generate
//     genvar caseIndex;
//         for (caseIndex = 0; caseIndex < 1024; caseIndex=caseIndex+1)
//             begin
//                 caseIndex: angle = 2*pi*caseIndex/1024;
//             end
//     endgenerate
//     end
// endcase

endmodule
