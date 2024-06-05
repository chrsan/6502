  res_lo = $0400
  mpd = res_lo + 1
  mpr = res_lo + 2

.org $0300

  lda #5
  sta mpd
  lda #3
  sta mpr

  lda #0      ; initialize result to zero (high)
  sta res_lo  ; initialize result to zero (low)
  ldx #8      ; x is the shift counter

loop:
  lsr mpr     ; shift mpr
  bcc no_add  ; branch if carry is clear
  clc         ; carry was 1. clear it
  adc mpd     ; a = a + mpd

no_add:
  ror a       ; shift result
  ror res_lo  ; catch bit into result (low)
  dex         ; decrement counter
  bne loop    ; last shift?
