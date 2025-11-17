// testbench.sv
`timescale 1ns / 1ps

module aes_128_decrypt_tb;

reg [127:0] ciphertext;
reg [127:0] key;
wire [127:0] plaintext;

integer passed, failed;

aes_128_decrypt uut (
    .ciphertext(ciphertext),
    .key(key),
    .plaintext(plaintext)
);

initial begin
    passed = 0;
    failed = 0;
    
    $dumpfile("dump.vcd");
    $dumpvars(0, aes_128_decrypt_tb);
    
    $display("");
    $display("===========================================");
    $display("AES-128 Decryption Test");
    $display("===========================================");
    $display("");
    
    // Test 1: NIST FIPS-197 Vector
    $display("Test 1: NIST FIPS-197 Standard Vector");
    ciphertext = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
    key = 128'h000102030405060708090a0b0c0d0e0f;
    #100;
    
    $display("  Ciphertext: %h", ciphertext);
    $display("  Key:        %h", key);
    $display("  Plaintext:  %h", plaintext);
    $display("  Expected:   00112233445566778899aabbccddeeff");
    
    if (plaintext == 128'h00112233445566778899aabbccddeeff) begin
        $display("  Result: PASS");
        passed = passed + 1;
    end else begin
        $display("  Result: FAIL");
        failed = failed + 1;
    end
    $display("");
    
    // Test 2: All-Zero
    $display("Test 2: All-Zero Vector");
    ciphertext = 128'h66e94bd4ef8a2c3b884cfa59ca342b2e;
    key = 128'h00000000000000000000000000000000;
    #100;
    
    $display("  Ciphertext: %h", ciphertext);
    $display("  Plaintext:  %h", plaintext);
    $display("  Expected:   00000000000000000000000000000000");
    
    if (plaintext == 128'h00000000000000000000000000000000) begin
        $display("  Result: PASS");
        passed = passed + 1;
    end else begin
        $display("  Result: FAIL");
        failed = failed + 1;
    end
    $display("");
    
    // Summary
    $display("===========================================");
    $display("Test Summary: %0d/%0d passed", passed, passed+failed);
    $display("===========================================");
    $display("");
    
    $finish;
end

endmodule
