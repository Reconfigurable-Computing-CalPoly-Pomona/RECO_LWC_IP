module substitute_lookup_table #(parameter fileName = "in.mem") (
    input clk,
    input [4:0] in,
    output reg [4:0] out
    );
    
    // signal declaration
    (*rom_style = "block"*) reg [4:0] rom [0:2**4 - 1];
    
    initial
        $readmemb(fileName, rom);
    always @(posedge clk)
        out <= rom[in];
endmodule
