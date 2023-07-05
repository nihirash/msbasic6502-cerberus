LINE = $FE ; and $FF       ; ADDR (2 bytes), store a LINE ADDR
ROW = LINE - 1 
COL = ROW - 1

KERN_PTR = $FA

UDG_DATA = $FCB1 ; 8 bites long

FRAM = $F000
VRAM = $F800
MAILFLAG = $0200
MAILBOX  = $0201

MAX_ROW = 30
MAX_COL = 40
SPACE   = ' '

LGR_ROWS = 60
LGR_COLS = 80

KBD_RET  = $0D  ; Return
KBD_BACK = 127  ; Backspace

KBD_UP = 23
KBD_DN = 19
KBD_LF = 1
KBD_RT = 4

APP_START = COLD_START