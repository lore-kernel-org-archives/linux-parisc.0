Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA10263
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 16:25:56 -0700
Message-Id: <200012022328.SAA04574@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sat, 2 Dec 2000 18:28:16 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <200012020748.CAA27280@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 2, 2000 02:48:45 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > In testing this, I tried to build glibc.  However, there seems to be
> > a problem with `L' character constants.  I keep getting the error
> > "character constant too long".  As another test, I am running a PIC
> > bootstrap and check in 32 bit mode under hpux 10.20.
> 
> The build failed but its too late to figure out what's wrong.

I reverted the pic patch that I was testing and still get the same build
failure when building with "-g -O3 -fPIC".

stage1/xgcc -Bstage1/ -B/usr/local/hppa1.1-hp-hpux10.20/bin/ -c  -DIN_GCC    -g -O3 -fPIC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. -I. -I../../gcc -I../../gcc/. -I../../gcc/config -I../../gcc/../include ../../gcc/c-decl.c -o c-decl.o
../../gcc/c-decl.c: In function `groktypename':
../../gcc/c-decl.c:7212: warning: ICE: would have deleted prologue/epilogue insn
(insn 162 160 163 (set (reg:SI 4 %r4)
        (reg:SI 19 %r19)) -1 (nil)
    (nil))
../../gcc/c-decl.c: In function `groktypename_in_parm_context':
../../gcc/c-decl.c:7212: warning: ICE: would have deleted prologue/epilogue insn

(insn 162 160 163 (set (reg:SI 4 %r4)
        (reg:SI 19 %r19)) -1 (nil)
    (nil))
stage1/xgcc -Bstage1/ -B/usr/local/hppa1.1-hp-hpux10.20/bin/ -c  -DIN_GCC    -g -O3 -fPIC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. -I. -I../../gcc -I../../gcc/. -I../../gcc/config -I../../gcc/../include ../../gcc/c-typeck.c -o c-typeck.o
../../gcc/c-typeck.c: In function `really_start_incremental_init':
../../gcc/c-typeck.c:5180: output_operand: invalid expression as operand
../../gcc/c-typeck.c:5180: Internal compiler error in output_operand_lossage, at final.c:3397
confused by earlier errors, bailing out
make[2]: *** [c-typeck.o] Error 1
make[2]: Leaving directory `/xxx/gnu/gcc-2.97/objdir/gcc'
make[1]: *** [stage_c] Error 2
make[1]: Leaving directory `/xxx/gnu/gcc-2.97/objdir/gcc'
make: *** [bootstrap-lean] Error 2

Looks like there is still more work to be done regarding pic code generation
for the hppa.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
