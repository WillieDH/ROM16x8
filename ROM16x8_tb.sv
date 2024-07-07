`timescale 1ns / 1ps

module ROM16x8_tb;
//inputs
reg [4:0] addr;
reg clk, enable;
//outputs
wire [7:0] dataOut;
integer i;

//instantiate design under test
ROM16x8 DUT(.addr(addr), .clk(clk), .enable(enable), .dataOut(dataOut));

always #10 clk <= ~clk; //create a clock 100MHz

//start stimuli
initial 
    begin
        clk = 1;
        addr = 4'b000;
        enable = 1'b1;
        #25; // settle values
    
        for (i = 0; i < 15; i = i + 1) 
            begin
                $monitor("%b", dataOut);
                addr = addr + 1;
                #20; // wait long enough for rising edge to notice (should be 5ns hold 10ns setup)
            end
            $finish;
    end //initial begin

endmodule
