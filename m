Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1FA2482A
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jan 2002 23:12:27 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id gtpgkaaa for parisc-linux@parisc-linux.org; Fri, 11 Jan 2002 23:12:38 -0700
Date: Fri, 11 Jan 2002 22:12:12 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FWD: gcc-3.0.3: ICE in reload_cse_simplify on hppa-linux
Message-ID: <20020112061212.GA21816@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020108073218.GC16533@tausq.org> <200201081545.g08FjX7A003677@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200201081545.g08FjX7A003677@hiauly1.hia.nrc.ca>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Then, I suggest trying with gcc-3.1 (prerelease).  It has quite a few
> bug fixes that 3.0.3 doesn't have although it hasn't been tested much
> on linux.  C and C++ definitely are in better shape.

Unfortunately 3.1 (i'm trying the 2002-01-07 snapshot) doesn't currently
build on hppa. It dies with:

stage1/xgcc -Bstage1/ -B/usr/hppa-linux/bin/ -c -DIN_GCC    -g -O2 -W
-Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-Wtraditional -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. -I.
-I../../src/gcc -I../../src/gcc/. -I../../src/gcc/config
-I../../src/gcc/../include ../../src/gcc/c-lex.c -o c-lex.o
../../src/gcc/c-lex.c: In function `lex_number':
../../src/gcc/c-lex.c:1293: Internal compiler error in
dwarf2out_frame_debug_expr, at dwarf2out.c:1535
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [c-lex.o] Error 1
make[2]: Leaving directory `/home/randolph/build/gcc/build/gcc'
make[1]: *** [stage2_build] Error 2

Traceback says:

#0  fancy_abort (file=0x36f504 "../../src/gcc/dwarf2out.c", line=1535, 
    function=0x36f564 "dwarf2out_frame_debug_expr")
    at ../../src/gcc/diagnostic.c:1450
#1  0x000b234c in dwarf2out_frame_debug_expr (expr=0x40191750, 
    label=0x3b86d0 "*.LCFI52") at ../../src/gcc/dwarf2out.c:1535
#2  0x000b26fc in dwarf2out_frame_debug (insn=0x40191750)
    at ../../src/gcc/dwarf2out.c:1650
#3  0x0010a4d0 in final_scan_insn (insn=0x4067f960, file=0x423a10, optimize=2, 
    prescan=0, nopeepholes=0) at ../../src/gcc/final.c:2653
#4  0x00108f98 in final (first=0x403dd720, file=0x423a10, optimize=2, 
    prescan=0) at ../../src/gcc/final.c:1787
[...]

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
