Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA32138
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Nov 1999 13:15:03 -0700
Message-Id: <4.2.0.58.19991130120934.00cc2c10@209.60.244.235>
Date: Tue, 30 Nov 1999 12:14:59 -0800
To: Alan Cox <alan@lxorguk.ukuu.org.uk>,
        Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
From: Mark Klein <mklein@dis.com>
Subject: Re: [parisc-linux] Progress - Update
Cc: dave@hiauly1.hia.nrc.ca, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        alan@lxorguk.ukuu.org.uk, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E11st08-00079l-00@the-village.bc.nu>
References: <19991130193244.A4951@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

At 07:31 PM 11/30/99 +0000, Alan Cox wrote:


> > to use spin_lock_irqsave / spin_unlock_irqrestore on an array of spinlocks
> > indexed by a hash of the address - x86istic code expecting xchg() to be
> > fast is going to suck I'd guess.
>
>You can catch the suitably aligned case. I don't think anyone will have a 
>problem
>if you submit patches over time so that critical xchg()'d objects are 16byte
>aligned where it doesnt impact other platforms.

You also have another option:

Create the xchg more as a "compare and swap" and separate the semaphore(s) from
the data. You can always keep the semaphores paragraph aligned and not worry
about where the data falls. Here's a sample of something I've used successfully
for many years:

;
;    function CompareSwap(var Semaphore   : integer;
;                             CellAddress : localanyptr;
;                             OldValue    : integer;
;                             NewValue    : integer) : integer;
;
;
; Local Register Use Declarations
;
Semaphore     .EQU    arg0
CellAddress   .EQU    arg1
OldValue      .EQU    arg2
NewValue      .EQU    arg3
;
; Pause Time Declaration
;
PauseTime     .EQU    0x3f4cc800


compareswap           .proc

         .export compareswap, entry
         .import PAUSE,code

         ldw     0(0,CellAddress),r20   ; dummy load to avoid page fault
         ldcws   0(0,Semaphore),ret0    ; load & clear shared memory
         ldw     0(0,CellAddress),r20   ; load contents of Cell into reg20
         comibf,=,n  1,ret0,spin        ; if sem. locked, go to sleep
         combf,=,n  r20,OldValue,noteq  ; go to noteq if Cell <> OldValue
         stw     NewValue,0(0,CellAddress) ; save new value into cell
         bv      r0(rp)                 ; return from whence we came
         stw     ret0,0(0,Semaphore)    ; reset semaphore to avail
noteq                                  ; the case of Cell <> OldValue
         stw     ret0,0(0,Semaphore)    ; reset semaphore to avail
         bv      r0(rp)                 ; return from whence we came
         or      r0,r0,ret0             ; return false

spin
         ldi     -50,r19                ; Initialize counter
         ldw     0(0,Semaphore),r31     ; Prime the pump
spinagain
         comibt,=   1,r31,compareswap   ; If so, do it again
         ldw     0(0,Semaphore),r31     ; Load Semaphore again
         addibt,<=,n 1,r19,spinagain    ; Try again if needed.
         nop

wait
         stw     rp,-20(sp)             ; .ENTER
         ldo     56(sp),sp              ; .ENTER
         stw     arg0, -92(0,sp)        ; save var Semaphore
         stw     arg1, -96(0,sp)        ; save CellAddress
         stw     arg2,-100(0,sp)        ; save OldValue
         stw     arg3,-104(0,sp)        ; save NewValue

;   prepare to call PAUSE
         ldil    L'PauseTime,r1         ; build sleep time value
         ldo     R'PauseTime(r1),r31
         stw     r31,-52(0,sp);         ; save it
         ldo     -52(sp),arg0           ; fetch address of time value

         ldil    L'PAUSE,r31            ; construct link to PAUSE
         .CALL
         ble     R'PAUSE(sr4,r31);      ; sleep
         COPY    r31,r2                 ; set return address

         ldw      -92(0,sp),arg0        ; restore var Semaphore
         ldw      -96(0,sp),arg1        ; restore CellAddress
         ldw     -100(0,sp),arg2        ; restore OldValue
         ldw     -104(0,sp),arg3        ; restore NewValue
         ldw     -76(sp),rp             ; restore return pointer
         b       compareswap            ; try lock the semaphore again
         ldo     -56(sp),sp             ; pop stack ptr back to previous one

         nop
         nop
         nop

         .callinfo     caller, save_rp
         .exit
         .procend


--
Mark Klein                                    DIS International, Ltd.
http://www.dis.com                            415-892-8400
PGP Public Key Available
--
