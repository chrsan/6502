  io_stat = $0100
  io_data = io_stat + 1

  .org $0200

  ldx #$00

loop:
  lda io_stat
  bne loop
  lda string, x
  beq done
  sta io_data
  inx
  jmp loop

done:
  brk

string: .asciiz "Hello, 6502 world!"
