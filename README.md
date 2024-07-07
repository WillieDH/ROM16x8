# 16x8-bit Read-Only Memory (ROM) in Vivado

This repository contains a 16x8 ROM design implemented in Verilog and SystemVerilog using Vivado. The ROM outputs ASCII characters that spell "I love you dude!" based on the address provided.

## Contents

- `ROM16x8.v`: Verilog module for the ROM design.
- `ROM16x8_tb.v`: Testbench module for verifying the functionality of `ROM16x8.v`.
- `README.md`: This file providing an overview of the repository.
- `ROM Schematic`: Sketch of general idea for the design.

## ROM Design

The ROM (Read-Only Memory) design utilizes a 4-bit address bus (`addr`) and operates on a positive clock edge (`clk`) when the `enable` signal is active. The ROM initializes with specific ASCII values corresponding to the message "I love you dude!".

- **Inputs and Outputs:**
  - **Inputs:** addr (4-bit), clk, enable (1-bit)
  - **Output:** dataOut (8-bit)

### Initialization

```verilog
initial 
    begin
        data[0]  = 8'b01001001; // 'I'
        data[1]  = 8'b00100000; // ' '
        data[2]  = 8'b01101100; // 'l'
        data[3]  = 8'b01101111; // 'o'
        data[4]  = 8'b01110110; // 'v'
        data[5]  = 8'b01100101; // 'e'
        data[6]  = 8'b00100000; // ' '
        data[7]  = 8'b01111001; // 'y'
        data[8]  = 8'b01101111; // 'o'
        data[9]  = 8'b01110101; // 'u'
        data[10] = 8'b00100000; // ' '
        data[11] = 8'b01100100; // 'd'
        data[12] = 8'b01110101; // 'u'
        data[13] = 8'b01100100; // 'd'
        data[14] = 8'b01100101; // 'e'
        data[15] = 8'b00100001; // '!'
    end
```

## Verification

The testbench ROM16x8_tb.v verifies the functionality of ROM16x8.v by generating a 100MHz clock (clk) and sequentially accessing each address from 0 to 15. It monitors the dataOut output to ensure it matches the expected ASCII values.

## Future Improvements

- Increase word amount by extended address bit bus.

## License

This project is licensed under the GNU GPL v3 - see the [LICENSE](LICENSE) file for details.