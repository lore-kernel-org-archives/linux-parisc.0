Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA02723
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Nov 1999 01:09:01 -0700
Sender: phi@hpfrcu81.france.hp.com
Message-ID: <382D1D85.7B3FA89F@hpfrcu03.france.hp.com>
Date: Sat, 13 Nov 1999 09:12:53 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>, bkatz@agilent.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ASP
References: <199911101524.HAA02309@meow.sr.hp.com> <19991111022331.W25252@mencheca.ch.genedata.com> <19991112205125.A10038@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> 
> but my guess is this would just result in a jump table of function calls
> rather than an indirect call - not going to improve performance measurably.
> 

I think it depends how compiled deal with pointer to function, in the
following example you got the asm code gened (with HP compiler), in compile #1
regular pointer to function, then the jump table is better
as the call to dyncall to perform the function call cost about dozen of
instruction, space register switching, etc...
On compile2 instructing the compiler that there is no shared lib (what does
happen on HP-UX kenel despite the DLKM, then the +ESfic canbe used greatly
reducing the pointer to function deref.

So I would say, if your compiler have a +ESfic kind of feature, you'd better
use the pointer to function array.

ic.c::
int f0(){}
int f1(){}
int f2(){}
int f3(){}
int (*fp[4])()={f0,f1,f2,f3};

f(i)
{ switch(i)
  { case 0:f0();break;
    case 1:f1();break;
    case 2:f2();break;
    case 3:f3();break;
   }

   (*fp[i])();

}

compile 1================================================
$ cc -S ic.c -O ; more ic.s
        .LEVEL  1.1

        .SPACE  $TEXT$,SORT=8
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f0
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x0
        .PROCEND        ;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f1
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x8
        .PROCEND        ;out=28;





        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f2
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x10
        .PROCEND        ;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f3
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x18
        .PROCEND        ;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f
        .PROC
        .CALLINFO CALLER,FRAME=16,ENTRY_GR=%r3,SAVE_RP,ARGS_SAVED
        .ENTRY
        STW     %r2,-20(%r30)   ;offset 0x20
        STW,MA  %r3,64(%r30)    ;offset 0x24
        CMPIB,<<        3,%r26,$00000001        ;offset 0x28
        COPY    %r26,%r3        ;offset 0x2c
        CMPIB,=,N       3,%r3,$00000005 ;offset 0x30
        CMPIB,<<,N      1,%r3,$00000004 ;offset 0x34
        CMPIB,=,N       1,%r3,$00000003 ;offset 0x38
        CMPB,<>,N       %r3,%r0,$00000001       ;offset 0x3c
$00000002
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f0,%r2  ;offset 0x40
        NOP             ;offset 0x44
        B       $00000001+4     ;offset 0x48
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x4c
$00000003
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f1,%r2  ;offset 0x50
        NOP             ;offset 0x54
        B       $00000001+4     ;offset 0x58
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x5c
$00000004
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f2,%r2  ;offset 0x60
        NOP             ;offset 0x64
        B       $00000001+4     ;offset 0x68
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x6c
$00000005
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f3,%r2  ;offset 0x70
        NOP             ;offset 0x74
$00000001
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x78
        LDO     RR'fp-$global$(%r1),%r31        ;offset 0x7c
        LDW,S   %r3(%r31),%r22  ;offset 0x80
        .CALL   RTNVAL=GR       ;in=22;out=28;
        B,L     $$dyncall,%r31  ;offset 0x84
        COPY    %r31,%r2        ;offset 0x88
        LDW     -84(%r30),%r2   ;offset 0x8c
        BV      %r0(%r2)        ;offset 0x90
        .EXIT
        LDW,MB  -64(%r30),%r3   ;offset 0x94
        .PROCEND        ;in=26;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SPACE  $PRIVATE$,SORT=16
        .SUBSPA $DATA$,QUAD=1,ALIGN=8,ACCESS=0x1f,SORT=16
fp
        .ALIGN  8
        .WORD  P'f0
        .WORD  P'f1
        .WORD  P'f2
        .WORD  P'f3
        .IMPORT $global$,DATA
        .SPACE  $TEXT$
        .SUBSPA $CODE$
        .EXPORT f0,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SUBSPA $CODE$
        .EXPORT f1,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SUBSPA $CODE$
        .EXPORT f2,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SUBSPA $CODE$
        .EXPORT f3,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SPACE  $PRIVATE$
        .SUBSPA $DATA$
        .EXPORT fp
        .SPACE  $TEXT$
        .SUBSPA $CODE$
        .EXPORT f,ENTRY,PRIV_LEV=3,ARGW0=GR,RTNVAL=GR
        .IMPORT $$dyncall,MILLICODE
        .END


compile 2=======================================================
$ cc -S ic.c +ESfic -O; more ic.s
        .LEVEL  1.1

        .SPACE  $TEXT$,SORT=8
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f0
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x0
        .PROCEND        ;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f1
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x8
        .PROCEND        ;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f2
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x10
        .PROCEND        ;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f3
        .PROC
        .CALLINFO FRAME=0
        .ENTRY
        .EXIT
        BV,N    %r0(%r2)        ;offset 0x18
        .PROCEND        ;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=0x2c,CODE_ONLY,SORT=24
f
        .PROC
        .CALLINFO CALLER,FRAME=80,ENTRY_GR=%r3,SAVE_RP,ARGS_SAVED
        .ENTRY
        STW     %r2,-20(%r30)   ;offset 0x20
        STW,MA  %r3,128(%r30)   ;offset 0x24
        CMPIB,<<        3,%r26,$00000001        ;offset 0x28
        COPY    %r26,%r3        ;offset 0x2c
        CMPIB,=,N       3,%r3,$00000005 ;offset 0x30
        CMPIB,<<,N      1,%r3,$00000004 ;offset 0x34
        CMPIB,=,N       1,%r3,$00000003 ;offset 0x38
        CMPB,<>,N       %r3,%r0,$00000001       ;offset 0x3c
$00000002
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f0,%r2  ;offset 0x40
        NOP             ;offset 0x44
        B       $00000001+4     ;offset 0x48
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x4c
$00000003
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f1,%r2  ;offset 0x50
        NOP             ;offset 0x54
        B       $00000001+4     ;offset 0x58
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x5c
$00000004
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f2,%r2  ;offset 0x60
        NOP             ;offset 0x64
        B       $00000001+4     ;offset 0x68
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x6c
$00000005
        .CALL   RTNVAL=GR       ;out=28;
        B,L     f3,%r2  ;offset 0x70
        NOP             ;offset 0x74
$00000001
        ADDIL   LR'fp-$global$,%r27,%r1 ;offset 0x78
        LDO     RR'fp-$global$(%r1),%r31        ;offset 0x7c
        LDW,S   %r3(%r31),%r24  ;offset 0x80
        STW     %r24,-112(%r30) ;offset 0x84
        LDW     -112(%r30),%r23 ;offset 0x88
        STW     %r23,-120(%r30) ;offset 0x8c
        .CALL   RTNVAL=GR       ;out=28;
        BE,L    0(%sr4,%r23),%r31       ;offset 0x90
        COPY    %r31,%r2        ;offset 0x94
        LDW     -148(%r30),%r2  ;offset 0x98
        LDW     -120(%r30),%r23 ;offset 0x9c
        BV      %r0(%r2)        ;offset 0xa0
        .EXIT
        LDW,MB  -128(%r30),%r3  ;offset 0xa4
        .PROCEND        ;in=26;out=28;



        .SPACE  $TEXT$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SUBSPA $CODE$
        .SPACE  $PRIVATE$,SORT=16
        .SUBSPA $DATA$,QUAD=1,ALIGN=8,ACCESS=0x1f,SORT=16
fp
        .ALIGN  8
        .WORD  P'f0
        .WORD  P'f1
        .WORD  P'f2
        .WORD  P'f3
        .IMPORT $global$,DATA
        .SPACE  $TEXT$
        .SUBSPA $CODE$
        .EXPORT f0,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SUBSPA $CODE$
        .EXPORT f1,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SUBSPA $CODE$
        .EXPORT f2,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SUBSPA $CODE$
        .EXPORT f3,ENTRY,PRIV_LEV=3,RTNVAL=GR
        .SPACE  $PRIVATE$
        .SUBSPA $DATA$
        .EXPORT fp
        .SPACE  $TEXT$
        .SUBSPA $CODE$
        .EXPORT f,ENTRY,PRIV_LEV=3,ARGW0=GR,RTNVAL=GR
        .END

======================================================================


--
mailto:phi@hpfrcu81.france.hp.com
WTEC Project. Kernel debugging tools
