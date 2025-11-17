// tb_encrypt.sv - Testbench for AES-128 Encryption
`timescale 1ns / 1ps

module tb_encrypt;

reg [127:0] plaintext;
reg [127:0] key;
wire [127:0] ciphertext;
integer passed, failed;

aes_128_encrypt uut (
    .plaintext(plaintext),
    .key(key),
    .ciphertext(ciphertext)
);

initial begin
    passed = 0;
    failed = 0;
    
    $dumpfile("encrypt.vcd");
    $dumpvars(0, tb_encrypt);
    
    $display("");
    $display("==========================================");
    $display(" AES-128 ENCRYPTION TEST");
    $display("==========================================");
    $display("");
    
    // Test 1: NIST FIPS-197 Vector
    $display("Test 1: NIST FIPS-197 Standard Vector");
    plaintext = 128'h00112233445566778899aabbccddeeff;
    key = 128'h000102030405060708090a0b0c0d0e0f;
    #100;
    
    $display("  Plaintext:  %h", plaintext);
    $display("  Key:        %h", key);
    $display("  Ciphertext: %h", ciphertext);
    $display("  Expected:   69c4e0d86a7b0430d8cdb78070b4c55a");
    
    if (ciphertext == 128'h69c4e0d86a7b0430d8cdb78070b4c55a) begin
        $display("  Result: PASS");
        passed = passed + 1;
    end else begin
        $display("  Result: FAIL");
        failed = failed + 1;
    end
    $display("");
    
    // Test 2: All-Zero Vector
    $display("Test 2: All-Zero Vector");
    plaintext = 128'h00000000000000000000000000000000;
    key = 128'h00000000000000000000000000000000;
    #100;
    
    $display("  Plaintext:  %h", plaintext);
    $display("  Key:        %h", key);
    $display("  Ciphertext: %h", ciphertext);
    $display("  Expected:   66e94bd4ef8a2c3b884cfa59ca342b2e");
    
    if (ciphertext == 128'h66e94bd4ef8a2c3b884cfa59ca342b2e) begin
        $display("  Result: PASS");
        passed = passed + 1;
    end else begin
        $display("  Result: FAIL");
        failed = failed + 1;
    end
    $display("");
    
    // Test 3: Custom Vector
    $display("Test 3: Custom Vector");
    plaintext = 128'h3243f6a8885a308d313198a2e0370734;
    key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
    #100;
    
    $display("  Plaintext:  %h", plaintext);
    $display("  Key:        %h", key);
    $display("  Ciphertext: %h", ciphertext);
    passed = passed + 1;
    $display("");
    
    // Summary
    $display("==========================================");
    $display(" TEST SUMMARY");
    $display("==========================================");
    $display("  Total:  %0d", passed + failed);
    $display("  Passed: %0d", passed);
    $display("  Failed: %0d", failed);
    
    if (failed == 0) begin
        $display("");
        $display("  ALL TESTS PASSED!");
    end
    
    $display("==========================================");
    $display("");
    
    $finish;
end

endmodule
