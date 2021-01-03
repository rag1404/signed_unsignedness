module signedness_unsignedness;
  logic [2:0] u1,u2;
  logic signed [2:0] s1,s2;
  logic [5:0] u3,u4,u5,u6;
  logic signed [5:0] s3,s4,s5,s6,s7;
  logic x;
 
  initial begin
    u1 = 3'b100;
    u2 = 3'b101;
    s1=  3'b101;
    s2=  3'b100;
    s5 = 6'b010101;
    u3 = u1+u2; // u3 = u1+u2, all of the operands are unsigned,so zero extension on u1,u2;
    $display ("unsigned u3 value is %b",u3);
    u3 += 2'b11; // unsigned = unsigned+unsigned// zero extension
    $display ("unsigned u3 value is %b",u3);
    s3 = s1+s2; // signed = signed+signed// sign extension
    $display ("signed s3 value is %b",s3);
    s4 = s1+1; // signed = signed+signed// sign extension
    $display ("signed s4 value is %b",s4);
    s4++; // s4= s4+1// signed = signed + signed // sign extension
    $display ("signed s4 value is %b",s4);
    s5 += 2'sb11; // signed = signed + signed// sign extension
    $display ("signed s5 value is %b",s5);
    s6 = u1+u2;// Even though s6 is signed, since u1,u2 are unsigned the experession is treated as unsigned.
    $display ("unsigned s6 value is %b",s6);
    u5 = s1+s2;// Even though u5 is unsigned, since s1,s2 are signed the experession is treated as signed.
    $display ("unsigned u5 value is %b",u5);
    s7 = u1+s1; // Even though s7 and s1 are signed, since u1 is unsigned the entire expression is treated as unsigned.
    $display ("unsigned s7 value is %b",s7);
    {x,u3} = u1+u2; // first evaluate the LHS self determined concatenation and the evaluate the size of RHS which is affected in the above example.
    
    $display ("unsigned {x,u3} value is %b",{x,u3}); // In this case, everything is expanded to 7 bits.
    u6 = u1+ |u2;
    $display ("unsigned u6 value is %b",u6);// First the unaray OR of U2 is performed and then zero extension is done and then evaluation of u1+u2 happens.
  end
  
  
endmodule
