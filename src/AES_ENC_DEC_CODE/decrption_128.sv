// design.sv - Complete AES-128 Decryption with all required modules
`timescale 1ns / 1ps

// ============================================================================
// MODULE 1: S-Box (Forward - for key expansion)
// ============================================================================
module sbox(
    input [7:0] in,
    output reg [7:0] out
);

always @(*) begin
    case(in)
        8'h00: out = 8'h63; 8'h01: out = 8'h7c; 8'h02: out = 8'h77; 8'h03: out = 8'h7b;
        8'h04: out = 8'hf2; 8'h05: out = 8'h6b; 8'h06: out = 8'h6f; 8'h07: out = 8'hc5;
        8'h08: out = 8'h30; 8'h09: out = 8'h01; 8'h0a: out = 8'h67; 8'h0b: out = 8'h2b;
        8'h0c: out = 8'hfe; 8'h0d: out = 8'hd7; 8'h0e: out = 8'hab; 8'h0f: out = 8'h76;
        8'h10: out = 8'hca; 8'h11: out = 8'h82; 8'h12: out = 8'hc9; 8'h13: out = 8'h7d;
        8'h14: out = 8'hfa; 8'h15: out = 8'h59; 8'h16: out = 8'h47; 8'h17: out = 8'hf0;
        8'h18: out = 8'had; 8'h19: out = 8'hd4; 8'h1a: out = 8'ha2; 8'h1b: out = 8'haf;
        8'h1c: out = 8'h9c; 8'h1d: out = 8'ha4; 8'h1e: out = 8'h72; 8'h1f: out = 8'hc0;
        8'h20: out = 8'hb7; 8'h21: out = 8'hfd; 8'h22: out = 8'h93; 8'h23: out = 8'h26;
        8'h24: out = 8'h36; 8'h25: out = 8'h3f; 8'h26: out = 8'hf7; 8'h27: out = 8'hcc;
        8'h28: out = 8'h34; 8'h29: out = 8'ha5; 8'h2a: out = 8'he5; 8'h2b: out = 8'hf1;
        8'h2c: out = 8'h71; 8'h2d: out = 8'hd8; 8'h2e: out = 8'h31; 8'h2f: out = 8'h15;
        8'h30: out = 8'h04; 8'h31: out = 8'hc7; 8'h32: out = 8'h23; 8'h33: out = 8'hc3;
        8'h34: out = 8'h18; 8'h35: out = 8'h96; 8'h36: out = 8'h05; 8'h37: out = 8'h9a;
        8'h38: out = 8'h07; 8'h39: out = 8'h12; 8'h3a: out = 8'h80; 8'h3b: out = 8'he2;
        8'h3c: out = 8'heb; 8'h3d: out = 8'h27; 8'h3e: out = 8'hb2; 8'h3f: out = 8'h75;
        8'h40: out = 8'h09; 8'h41: out = 8'h83; 8'h42: out = 8'h2c; 8'h43: out = 8'h1a;
        8'h44: out = 8'h1b; 8'h45: out = 8'h6e; 8'h46: out = 8'h5a; 8'h47: out = 8'ha0;
        8'h48: out = 8'h52; 8'h49: out = 8'h3b; 8'h4a: out = 8'hd6; 8'h4b: out = 8'hb3;
        8'h4c: out = 8'h29; 8'h4d: out = 8'he3; 8'h4e: out = 8'h2f; 8'h4f: out = 8'h84;
        8'h50: out = 8'h53; 8'h51: out = 8'hd1; 8'h52: out = 8'h00; 8'h53: out = 8'hed;
        8'h54: out = 8'h20; 8'h55: out = 8'hfc; 8'h56: out = 8'hb1; 8'h57: out = 8'h5b;
        8'h58: out = 8'h6a; 8'h59: out = 8'hcb; 8'h5a: out = 8'hbe; 8'h5b: out = 8'h39;
        8'h5c: out = 8'h4a; 8'h5d: out = 8'h4c; 8'h5e: out = 8'h58; 8'h5f: out = 8'hcf;
        8'h60: out = 8'hd0; 8'h61: out = 8'hef; 8'h62: out = 8'haa; 8'h63: out = 8'hfb;
        8'h64: out = 8'h43; 8'h65: out = 8'h4d; 8'h66: out = 8'h33; 8'h67: out = 8'h85;
        8'h68: out = 8'h45; 8'h69: out = 8'hf9; 8'h6a: out = 8'h02; 8'h6b: out = 8'h7f;
        8'h6c: out = 8'h50; 8'h6d: out = 8'h3c; 8'h6e: out = 8'h9f; 8'h6f: out = 8'ha8;
        8'h70: out = 8'h51; 8'h71: out = 8'ha3; 8'h72: out = 8'h40; 8'h73: out = 8'h8f;
        8'h74: out = 8'h92; 8'h75: out = 8'h9d; 8'h76: out = 8'h38; 8'h77: out = 8'hf5;
        8'h78: out = 8'hbc; 8'h79: out = 8'hb6; 8'h7a: out = 8'hda; 8'h7b: out = 8'h21;
        8'h7c: out = 8'h10; 8'h7d: out = 8'hff; 8'h7e: out = 8'hf3; 8'h7f: out = 8'hd2;
        8'h80: out = 8'hcd; 8'h81: out = 8'h0c; 8'h82: out = 8'h13; 8'h83: out = 8'hec;
        8'h84: out = 8'h5f; 8'h85: out = 8'h97; 8'h86: out = 8'h44; 8'h87: out = 8'h17;
        8'h88: out = 8'hc4; 8'h89: out = 8'ha7; 8'h8a: out = 8'h7e; 8'h8b: out = 8'h3d;
        8'h8c: out = 8'h64; 8'h8d: out = 8'h5d; 8'h8e: out = 8'h19; 8'h8f: out = 8'h73;
        8'h90: out = 8'h60; 8'h91: out = 8'h81; 8'h92: out = 8'h4f; 8'h93: out = 8'hdc;
        8'h94: out = 8'h22; 8'h95: out = 8'h2a; 8'h96: out = 8'h90; 8'h97: out = 8'h88;
        8'h98: out = 8'h46; 8'h99: out = 8'hee; 8'h9a: out = 8'hb8; 8'h9b: out = 8'h14;
        8'h9c: out = 8'hde; 8'h9d: out = 8'h5e; 8'h9e: out = 8'h0b; 8'h9f: out = 8'hdb;
        8'ha0: out = 8'he0; 8'ha1: out = 8'h32; 8'ha2: out = 8'h3a; 8'ha3: out = 8'h0a;
        8'ha4: out = 8'h49; 8'ha5: out = 8'h06; 8'ha6: out = 8'h24; 8'ha7: out = 8'h5c;
        8'ha8: out = 8'hc2; 8'ha9: out = 8'hd3; 8'haa: out = 8'hac; 8'hab: out = 8'h62;
        8'hac: out = 8'h91; 8'had: out = 8'h95; 8'hae: out = 8'he4; 8'haf: out = 8'h79;
        8'hb0: out = 8'he7; 8'hb1: out = 8'hc8; 8'hb2: out = 8'h37; 8'hb3: out = 8'h6d;
        8'hb4: out = 8'h8d; 8'hb5: out = 8'hd5; 8'hb6: out = 8'h4e; 8'hb7: out = 8'ha9;
        8'hb8: out = 8'h6c; 8'hb9: out = 8'h56; 8'hba: out = 8'hf4; 8'hbb: out = 8'hea;
        8'hbc: out = 8'h65; 8'hbd: out = 8'h7a; 8'hbe: out = 8'hae; 8'hbf: out = 8'h08;
        8'hc0: out = 8'hba; 8'hc1: out = 8'h78; 8'hc2: out = 8'h25; 8'hc3: out = 8'h2e;
        8'hc4: out = 8'h1c; 8'hc5: out = 8'ha6; 8'hc6: out = 8'hb4; 8'hc7: out = 8'hc6;
        8'hc8: out = 8'he8; 8'hc9: out = 8'hdd; 8'hca: out = 8'h74; 8'hcb: out = 8'h1f;
        8'hcc: out = 8'h4b; 8'hcd: out = 8'hbd; 8'hce: out = 8'h8b; 8'hcf: out = 8'h8a;
        8'hd0: out = 8'h70; 8'hd1: out = 8'h3e; 8'hd2: out = 8'hb5; 8'hd3: out = 8'h66;
        8'hd4: out = 8'h48; 8'hd5: out = 8'h03; 8'hd6: out = 8'hf6; 8'hd7: out = 8'h0e;
        8'hd8: out = 8'h61; 8'hd9: out = 8'h35; 8'hda: out = 8'h57; 8'hdb: out = 8'hb9;
        8'hdc: out = 8'h86; 8'hdd: out = 8'hc1; 8'hde: out = 8'h1d; 8'hdf: out = 8'h9e;
        8'he0: out = 8'he1; 8'he1: out = 8'hf8; 8'he2: out = 8'h98; 8'he3: out = 8'h11;
        8'he4: out = 8'h69; 8'he5: out = 8'hd9; 8'he6: out = 8'h8e; 8'he7: out = 8'h94;
        8'he8: out = 8'h9b; 8'he9: out = 8'h1e; 8'hea: out = 8'h87; 8'heb: out = 8'he9;
        8'hec: out = 8'hce; 8'hed: out = 8'h55; 8'hee: out = 8'h28; 8'hef: out = 8'hdf;
        8'hf0: out = 8'h8c; 8'hf1: out = 8'ha1; 8'hf2: out = 8'h89; 8'hf3: out = 8'h0d;
        8'hf4: out = 8'hbf; 8'hf5: out = 8'he6; 8'hf6: out = 8'h42; 8'hf7: out = 8'h68;
        8'hf8: out = 8'h41; 8'hf9: out = 8'h99; 8'hfa: out = 8'h2d; 8'hfb: out = 8'h0f;
        8'hfc: out = 8'hb0; 8'hfd: out = 8'h54; 8'hfe: out = 8'hbb; 8'hff: out = 8'h16;
    endcase
end

endmodule

// ============================================================================
// MODULE 2: Inverse S-Box (for decryption)
// ============================================================================
module inv_sbox(
    input [7:0] in,
    output reg [7:0] out
);

always @(*) begin
    case(in)
        8'h00: out = 8'h52; 8'h01: out = 8'h09; 8'h02: out = 8'h6a; 8'h03: out = 8'hd5;
        8'h04: out = 8'h30; 8'h05: out = 8'h36; 8'h06: out = 8'ha5; 8'h07: out = 8'h38;
        8'h08: out = 8'hbf; 8'h09: out = 8'h40; 8'h0a: out = 8'ha3; 8'h0b: out = 8'h9e;
        8'h0c: out = 8'h81; 8'h0d: out = 8'hf3; 8'h0e: out = 8'hd7; 8'h0f: out = 8'hfb;
        8'h10: out = 8'h7c; 8'h11: out = 8'he3; 8'h12: out = 8'h39; 8'h13: out = 8'h82;
        8'h14: out = 8'h9b; 8'h15: out = 8'h2f; 8'h16: out = 8'hff; 8'h17: out = 8'h87;
        8'h18: out = 8'h34; 8'h19: out = 8'h8e; 8'h1a: out = 8'h43; 8'h1b: out = 8'h44;
        8'h1c: out = 8'hc4; 8'h1d: out = 8'hde; 8'h1e: out = 8'he9; 8'h1f: out = 8'hcb;
        8'h20: out = 8'h54; 8'h21: out = 8'h7b; 8'h22: out = 8'h94; 8'h23: out = 8'h32;
        8'h24: out = 8'ha6; 8'h25: out = 8'hc2; 8'h26: out = 8'h23; 8'h27: out = 8'h3d;
        8'h28: out = 8'hee; 8'h29: out = 8'h4c; 8'h2a: out = 8'h95; 8'h2b: out = 8'h0b;
        8'h2c: out = 8'h42; 8'h2d: out = 8'hfa; 8'h2e: out = 8'hc3; 8'h2f: out = 8'h4e;
        8'h30: out = 8'h08; 8'h31: out = 8'h2e; 8'h32: out = 8'ha1; 8'h33: out = 8'h66;
        8'h34: out = 8'h28; 8'h35: out = 8'hd9; 8'h36: out = 8'h24; 8'h37: out = 8'hb2;
        8'h38: out = 8'h76; 8'h39: out = 8'h5b; 8'h3a: out = 8'ha2; 8'h3b: out = 8'h49;
        8'h3c: out = 8'h6d; 8'h3d: out = 8'h8b; 8'h3e: out = 8'hd1; 8'h3f: out = 8'h25;
        8'h40: out = 8'h72; 8'h41: out = 8'hf8; 8'h42: out = 8'hf6; 8'h43: out = 8'h64;
        8'h44: out = 8'h86; 8'h45: out = 8'h68; 8'h46: out = 8'h98; 8'h47: out = 8'h16;
        8'h48: out = 8'hd4; 8'h49: out = 8'ha4; 8'h4a: out = 8'h5c; 8'h4b: out = 8'hcc;
        8'h4c: out = 8'h5d; 8'h4d: out = 8'h65; 8'h4e: out = 8'hb6; 8'h4f: out = 8'h92;
        8'h50: out = 8'h6c; 8'h51: out = 8'h70; 8'h52: out = 8'h48; 8'h53: out = 8'h50;
        8'h54: out = 8'hfd; 8'h55: out = 8'hed; 8'h56: out = 8'hb9; 8'h57: out = 8'hda;
        8'h58: out = 8'h5e; 8'h59: out = 8'h15; 8'h5a: out = 8'h46; 8'h5b: out = 8'h57;
        8'h5c: out = 8'ha7; 8'h5d: out = 8'h8d; 8'h5e: out = 8'h9d; 8'h5f: out = 8'h84;
        8'h60: out = 8'h90; 8'h61: out = 8'hd8; 8'h62: out = 8'hab; 8'h63: out = 8'h00;
        8'h64: out = 8'h8c; 8'h65: out = 8'hbc; 8'h66: out = 8'hd3; 8'h67: out = 8'h0a;
        8'h68: out = 8'hf7; 8'h69: out = 8'he4; 8'h6a: out = 8'h58; 8'h6b: out = 8'h05;
        8'h6c: out = 8'hb8; 8'h6d: out = 8'hb3; 8'h6e: out = 8'h45; 8'h6f: out = 8'h06;
        8'h70: out = 8'hd0; 8'h71: out = 8'h2c; 8'h72: out = 8'h1e; 8'h73: out = 8'h8f;
        8'h74: out = 8'hca; 8'h75: out = 8'h3f; 8'h76: out = 8'h0f; 8'h77: out = 8'h02;
        8'h78: out = 8'hc1; 8'h79: out = 8'haf; 8'h7a: out = 8'hbd; 8'h7b: out = 8'h03;
        8'h7c: out = 8'h01; 8'h7d: out = 8'h13; 8'h7e: out = 8'h8a; 8'h7f: out = 8'h6b;
        8'h80: out = 8'h3a; 8'h81: out = 8'h91; 8'h82: out = 8'h11; 8'h83: out = 8'h41;
        8'h84: out = 8'h4f; 8'h85: out = 8'h67; 8'h86: out = 8'hdc; 8'h87: out = 8'hea;
        8'h88: out = 8'h97; 8'h89: out = 8'hf2; 8'h8a: out = 8'hcf; 8'h8b: out = 8'hce;
        8'h8c: out = 8'hf0; 8'h8d: out = 8'hb4; 8'h8e: out = 8'he6; 8'h8f: out = 8'h73;
        8'h90: out = 8'h96; 8'h91: out = 8'hac; 8'h92: out = 8'h74; 8'h93: out = 8'h22;
        8'h94: out = 8'he7; 8'h95: out = 8'had; 8'h96: out = 8'h35; 8'h97: out = 8'h85;
        8'h98: out = 8'he2; 8'h99: out = 8'hf9; 8'h9a: out = 8'h37; 8'h9b: out = 8'he8;
        8'h9c: out = 8'h1c; 8'h9d: out = 8'h75; 8'h9e: out = 8'hdf; 8'h9f: out = 8'h6e;
        8'ha0: out = 8'h47; 8'ha1: out = 8'hf1; 8'ha2: out = 8'h1a; 8'ha3: out = 8'h71;
        8'ha4: out = 8'h1d; 8'ha5: out = 8'h29; 8'ha6: out = 8'hc5; 8'ha7: out = 8'h89;
        8'ha8: out = 8'h6f; 8'ha9: out = 8'hb7; 8'haa: out = 8'h62; 8'hab: out = 8'h0e;
        8'hac: out = 8'haa; 8'had: out = 8'h18; 8'hae: out = 8'hbe; 8'haf: out = 8'h1b;
        8'hb0: out = 8'hfc; 8'hb1: out = 8'h56; 8'hb2: out = 8'h3e; 8'hb3: out = 8'h4b;
        8'hb4: out = 8'hc6; 8'hb5: out = 8'hd2; 8'hb6: out = 8'h79; 8'hb7: out = 8'h20;
        8'hb8: out = 8'h9a; 8'hb9: out = 8'hdb; 8'hba: out = 8'hc0; 8'hbb: out = 8'hfe;
        8'hbc: out = 8'h78; 8'hbd: out = 8'hcd; 8'hbe: out = 8'h5a; 8'hbf: out = 8'hf4;
        8'hc0: out = 8'h1f; 8'hc1: out = 8'hdd; 8'hc2: out = 8'ha8; 8'hc3: out = 8'h33;
        8'hc4: out = 8'h88; 8'hc5: out = 8'h07; 8'hc6: out = 8'hc7; 8'hc7: out = 8'h31;
        8'hc8: out = 8'hb1; 8'hc9: out = 8'h12; 8'hca: out = 8'h10; 8'hcb: out = 8'h59;
        8'hcc: out = 8'h27; 8'hcd: out = 8'h80; 8'hce: out = 8'hec; 8'hcf: out = 8'h5f;
        8'hd0: out = 8'h60; 8'hd1: out = 8'h51; 8'hd2: out = 8'h7f; 8'hd3: out = 8'ha9;
        8'hd4: out = 8'h19; 8'hd5: out = 8'hb5; 8'hd6: out = 8'h4a; 8'hd7: out = 8'h0d;
        8'hd8: out = 8'h2d; 8'hd9: out = 8'he5; 8'hda: out = 8'h7a; 8'hdb: out = 8'h9f;
        8'hdc: out = 8'h93; 8'hdd: out = 8'hc9; 8'hde: out = 8'h9c; 8'hdf: out = 8'hef;
        8'he0: out = 8'ha0; 8'he1: out = 8'he0; 8'he2: out = 8'h3b; 8'he3: out = 8'h4d;
        8'he4: out = 8'hae; 8'he5: out = 8'h2a; 8'he6: out = 8'hf5; 8'he7: out = 8'hb0;
        8'he8: out = 8'hc8; 8'he9: out = 8'heb; 8'hea: out = 8'hbb; 8'heb: out = 8'h3c;
        8'hec: out = 8'h83; 8'hed: out = 8'h53; 8'hee: out = 8'h99; 8'hef: out = 8'h61;
        8'hf0: out = 8'h17; 8'hf1: out = 8'h2b; 8'hf2: out = 8'h04; 8'hf3: out = 8'h7e;
        8'hf4: out = 8'hba; 8'hf5: out = 8'h77; 8'hf6: out = 8'hd6; 8'hf7: out = 8'h26;
        8'hf8: out = 8'he1; 8'hf9: out = 8'h69; 8'hfa: out = 8'h14; 8'hfb: out = 8'h63;
        8'hfc: out = 8'h55; 8'hfd: out = 8'h21; 8'hfe: out = 8'h0c; 8'hff: out = 8'h7d;
    endcase
end

endmodule

// ============================================================================
// MODULE 3: Key Expansion for AES-128
// ============================================================================
module key_expansion_128(
    input [127:0] key,
    output [1407:0] round_keys_flat  // 11 keys x 128 bits = 1408 bits
);

// Round constants
wire [31:0] rcon [0:9];
assign rcon[0] = 32'h01000000;
assign rcon[1] = 32'h02000000;
assign rcon[2] = 32'h04000000;
assign rcon[3] = 32'h08000000;
assign rcon[4] = 32'h10000000;
assign rcon[5] = 32'h20000000;
assign rcon[6] = 32'h40000000;
assign rcon[7] = 32'h80000000;
assign rcon[8] = 32'h1b000000;
assign rcon[9] = 32'h36000000;

// Key words
wire [31:0] w [0:43];

// Initial key words
assign w[0] = key[127:96];
assign w[1] = key[95:64];
assign w[2] = key[63:32];
assign w[3] = key[31:0];

// Generate round keys
genvar i;
generate
    for (i = 4; i <= 43; i = i + 1) begin : key_schedule
        if (i % 4 == 0) begin
            wire [31:0] temp;
            wire [31:0] rotword;
            wire [7:0] sb0_out, sb1_out, sb2_out, sb3_out;
            
            assign temp = w[i-1];
            assign rotword = {temp[23:0], temp[31:24]};
            
            sbox sb0(.in(rotword[31:24]), .out(sb0_out));
            sbox sb1(.in(rotword[23:16]), .out(sb1_out));
            sbox sb2(.in(rotword[15:8]),  .out(sb2_out));
            sbox sb3(.in(rotword[7:0]),   .out(sb3_out));
            
            assign w[i] = w[i-4] ^ {sb0_out, sb1_out, sb2_out, sb3_out} ^ rcon[i/4 - 1];
        end else begin
            assign w[i] = w[i-4] ^ w[i-1];
        end
    end
endgenerate

// Pack round keys into flat output
generate
    for (i = 0; i <= 10; i = i + 1) begin : pack_keys
        assign round_keys_flat[1407 - i*128 -: 128] = {w[i*4], w[i*4+1], w[i*4+2], w[i*4+3]};
    end
endgenerate

endmodule

// ============================================================================
// MODULE 4: Inverse MixColumns
// ============================================================================
module inv_mix_columns(
    input [127:0] state_in,
    output [127:0] state_out
);

function [7:0] gf_mult_by_02;
    input [7:0] in;
    begin
        gf_mult_by_02 = (in[7]) ? ((in << 1) ^ 8'h1b) : (in << 1);
    end
endfunction

function [7:0] gf_mult_by_09;
    input [7:0] in;
    begin
        gf_mult_by_09 = gf_mult_by_02(gf_mult_by_02(gf_mult_by_02(in))) ^ in;
    end
endfunction

function [7:0] gf_mult_by_0b;
    input [7:0] in;
    begin
        gf_mult_by_0b = gf_mult_by_02(gf_mult_by_02(gf_mult_by_02(in))) ^ gf_mult_by_02(in) ^ in;
    end
endfunction

function [7:0] gf_mult_by_0d;
    input [7:0] in;
    begin
        gf_mult_by_0d = gf_mult_by_02(gf_mult_by_02(gf_mult_by_02(in))) ^ gf_mult_by_02(gf_mult_by_02(in)) ^ in;
    end
endfunction

function [7:0] gf_mult_by_0e;
    input [7:0] in;
    begin
        gf_mult_by_0e = gf_mult_by_02(gf_mult_by_02(gf_mult_by_02(in))) ^ gf_mult_by_02(gf_mult_by_02(in)) ^ gf_mult_by_02(in);
    end
endfunction

genvar col;
generate
    for (col = 0; col < 4; col = col + 1) begin : inv_mix_col
        wire [7:0] s0, s1, s2, s3;
        wire [7:0] s0_new, s1_new, s2_new, s3_new;
        
        assign s0 = state_in[127 - 32*col -: 8];
        assign s1 = state_in[119 - 32*col -: 8];
        assign s2 = state_in[111 - 32*col -: 8];
        assign s3 = state_in[103 - 32*col -: 8];
        
        assign s0_new = gf_mult_by_0e(s0) ^ gf_mult_by_0b(s1) ^ gf_mult_by_0d(s2) ^ gf_mult_by_09(s3);
        assign s1_new = gf_mult_by_09(s0) ^ gf_mult_by_0e(s1) ^ gf_mult_by_0b(s2) ^ gf_mult_by_0d(s3);
        assign s2_new = gf_mult_by_0d(s0) ^ gf_mult_by_09(s1) ^ gf_mult_by_0e(s2) ^ gf_mult_by_0b(s3);
        assign s3_new = gf_mult_by_0b(s0) ^ gf_mult_by_0d(s1) ^ gf_mult_by_09(s2) ^ gf_mult_by_0e(s3);
        
        assign state_out[127 - 32*col -: 8] = s0_new;
        assign state_out[119 - 32*col -: 8] = s1_new;
        assign state_out[111 - 32*col -: 8] = s2_new;
        assign state_out[103 - 32*col -: 8] = s3_new;
    end
endgenerate

endmodule

// ============================================================================
// MODULE 5: AES-128 Decryption Main Module
// ============================================================================
module aes_128_decrypt(
    input [127:0] ciphertext,
    input [127:0] key,
    output [127:0] plaintext
);

// Get round keys
wire [1407:0] round_keys_flat;
key_expansion_128 key_exp(.key(key), .round_keys_flat(round_keys_flat));

// Extract individual round keys
wire [127:0] round_keys [0:10];
genvar rk;
generate
    for (rk = 0; rk <= 10; rk = rk + 1) begin : extract_keys
        assign round_keys[rk] = round_keys_flat[1407 - rk*128 -: 128];
    end
endgenerate

// State array
wire [127:0] state [0:10];

// Initial AddRoundKey
assign state[0] = ciphertext ^ round_keys[10];

// Main rounds
genvar round;
generate
    for (round = 1; round < 10; round = round + 1) begin : main_rounds
        wire [127:0] after_invshiftrows;
        wire [127:0] after_invsubbytes;
        wire [127:0] after_addroundkey;
        
        // InvShiftRows
        assign after_invshiftrows[127:120] = state[round-1][127:120];
        assign after_invshiftrows[119:112] = state[round-1][23:16];
        assign after_invshiftrows[111:104] = state[round-1][47:40];
        assign after_invshiftrows[103:96]  = state[round-1][71:64];
        assign after_invshiftrows[95:88]   = state[round-1][95:88];
        assign after_invshiftrows[87:80]   = state[round-1][119:112];
        assign after_invshiftrows[79:72]   = state[round-1][15:8];
        assign after_invshiftrows[71:64]   = state[round-1][39:32];
        assign after_invshiftrows[63:56]   = state[round-1][63:56];
        assign after_invshiftrows[55:48]   = state[round-1][87:80];
        assign after_invshiftrows[47:40]   = state[round-1][111:104];
        assign after_invshiftrows[39:32]   = state[round-1][7:0];
        assign after_invshiftrows[31:24]   = state[round-1][31:24];
        assign after_invshiftrows[23:16]   = state[round-1][55:48];
        assign after_invshiftrows[15:8]    = state[round-1][79:72];
        assign after_invshiftrows[7:0]     = state[round-1][103:96];
        
        // InvSubBytes
        genvar byte_idx;
        for (byte_idx = 0; byte_idx < 16; byte_idx = byte_idx + 1) begin : invsubbytes
            inv_sbox isb(
                .in(after_invshiftrows[127 - 8*byte_idx -: 8]),
                .out(after_invsubbytes[127 - 8*byte_idx -: 8])
            );
        end
        
        // AddRoundKey
        assign after_addroundkey = after_invsubbytes ^ round_keys[10 - round];
        
        // InvMixColumns
        inv_mix_columns imc(
            .state_in(after_addroundkey),
            .state_out(state[round])
        );
    end
endgenerate

// Final round
wire [127:0] final_invshiftrows;
wire [127:0] final_invsubbytes;

assign final_invshiftrows[127:120] = state[9][127:120];
assign final_invshiftrows[119:112] = state[9][23:16];
assign final_invshiftrows[111:104] = state[9][47:40];
assign final_invshiftrows[103:96]  = state[9][71:64];
assign final_invshiftrows[95:88]   = state[9][95:88];
assign final_invshiftrows[87:80]   = state[9][119:112];
assign final_invshiftrows[79:72]   = state[9][15:8];
assign final_invshiftrows[71:64]   = state[9][39:32];
assign final_invshiftrows[63:56]   = state[9][63:56];
assign final_invshiftrows[55:48]   = state[9][87:80];
assign final_invshiftrows[47:40]   = state[9][111:104];
assign final_invshiftrows[39:32]   = state[9][7:0];
assign final_invshiftrows[31:24]   = state[9][31:24];
assign final_invshiftrows[23:16]   = state[9][55:48];
assign final_invshiftrows[15:8]    = state[9][79:72];
assign final_invshiftrows[7:0]     = state[9][103:96];

genvar final_byte;
generate
    for (final_byte = 0; final_byte < 16; final_byte = final_byte + 1) begin : final_invsubbytes_gen
        inv_sbox isb(
            .in(final_invshiftrows[127 - 8*final_byte -: 8]),
            .out(final_invsubbytes[127 - 8*final_byte -: 8])
        );
    end
endgenerate

assign state[10] = final_invsubbytes ^ round_keys[0];
assign plaintext = state[10];

endmodule
