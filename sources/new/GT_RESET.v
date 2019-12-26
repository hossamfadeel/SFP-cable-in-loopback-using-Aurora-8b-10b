`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2019 05:49:45 PM
// Design Name: 
// Module Name: GT_RESET
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module GT_RESET(input wire CLK, input wire RESET, output wire RESET_GT );

reg [7:0] counter=0;
reg [3:0] period =0;
reg regRESET_GT;
assign  RESET_GT = RESET | regRESET_GT; 
always @(posedge CLK)
  begin
  if (RESET )
    begin
       counter<=0;
       period  <=0;
       regRESET_GT<= RESET;
   end
  else 
    begin
    if (counter == 255)
        counter <= counter;
    else
    counter <= counter+1;
  
    if (counter < 50)
        regRESET_GT<= 1'b1; 
    else if (counter < 100)
        regRESET_GT<= 1'b0;
     else if (counter < 150)
        regRESET_GT<= 1'b1;
     else if (counter < 200)
        regRESET_GT<= 1'b0;      
              
    end
  end
endmodule
