;; Minimal graphics primitive - POINT
;; Another primitives will be implemented using it

; Draw single point on screen
; A - Y
; X - X
plot:
  pha
  phx
  clc
  ror
  jsr get_line_address
  sta LINE_START
  stx LINE_START + 1
  pla
  pha
  clc
  ror
  tay
  sty lgr_y
  lda (LINE_START), y
  tax
  and #$7f
  cmp #$08
  bcc @detect_tile
  ldy #$00
@tile_number_found:
    sty tile_number
    ply
    pla
    jsr coordinate_to_tile
    clc
    ora tile_number
    
    tay
    lda character_table, y
    ldy lgr_y
    sta (LINE_START), y
    rts
@detect_tile:
    ldy #$00
    txa
@look_up_tile:
    cmp character_table,y
    beq @tile_number_found
    iny
    jmp @look_up_tile

;; Returns tile number by coordinates
;; A - Y
;; Y - X
coordinate_to_tile:
 phx
 and #1
 tax
 tya
 ror
 pha
 php
 txa
 plp
 rol
 tay
 lda pixels_table, y
 ply
 plx
 rts
