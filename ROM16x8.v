`timescale 1ns / 1ps

module ROM16x8(addr, enable, clk ,dataOut);
input [3:0] addr; //4-bit address bus
input enable, clk; 
output reg [7:0] dataOut; //8-bit data bus
reg [7:0] data [15:0];

//initialize ROM values
initial 
    begin
        data[0] = 8'b01001001;
        data[1] = 8'b00100000;
        data[2] = 8'b01101100;
        data[3] = 8'b01101111;
        data[4] = 8'b01110110;
        data[5] = 8'b01100101;
        data[6] = 8'b00100000;
        data[7] = 8'b01111001;
        data[8] = 8'b01101111;
        data[9] = 8'b01110101;
        data[10] = 8'b00100000;
        data[11] = 8'b01100100;
        data[12] = 8'b01110101;
        data[13] = 8'b01100100;
        data[14] = 8'b01100101;
        data[15] = 8'b00100001;
    end


// on positive edge of clock, if enable is active, read from addr
always @ (posedge clk) 
    begin
        if (enable) 
            begin
                case (addr) 
                    4'b0000 : dataOut <= data[0];
                    4'b0001 : dataOut <= data[1];
                    4'b0010 : dataOut <= data[2];
                    4'b0011 : dataOut <= data[3];
                    4'b0100 : dataOut <= data[4];
                    4'b0101 : dataOut <= data[5];
                    4'b0110 : dataOut <= data[6];
                    4'b0111 : dataOut <= data[7];
                    4'b1000 : dataOut <= data[8];
                    4'b1001 : dataOut <= data[9];
                    4'b1010 : dataOut <= data[10];
                    4'b1011 : dataOut <= data[11];
                    4'b1100 : dataOut <= data[12];
                    4'b1101 : dataOut <= data[13];
                    4'b1110 : dataOut <= data[14];
                    4'b1111 : dataOut <= data[15];
                    default: dataOut <= 8'b00000000;
                endcase
            end 
    end // always begin


endmodule
