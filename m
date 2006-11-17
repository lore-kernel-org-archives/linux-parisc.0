From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc ICE PR29114 (was: 64-bit long double support.)
Date: Fri, 17 Nov 2006 15:51:27 -0500
Message-ID: <20061117205126.GA15716@hiauly1.hia.nrc.ca>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611162310.03845.vapier@gentoo.org>
	<20061117053556.GA694@hiauly1.hia.nrc.ca>
	<200611171502.49875.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611171502.49875.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> i've attached my gdb run ... i'm not familiar with gcc so i dont know what 
> more information you need to see to debug

Excellent progress.

> Breakpoint 1, emit_move_sequence (operands=0x7c3908288900, mode=DImode, scratch_reg=0x0)
>     at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/config/pa/pa.c:1309
> 1309	{

What we need to see is the backtrace when emit_move_sequence (or emit_insn)
is called with operands that match those in the insn that causes the ICE below.
This will localize the area of the problem.

In the call to emit_move_sequence, operands is an array.  operands[0] is
the DEST for the move operation.  operands[1] is the SRC.

You can see the RTL for the first two operands with the commands:

p debug_rtl (operands[0])
p debug_rtl (operands[1])

In the break at emit_insn,

p debug_rtl (x)

will print "x" in formated form.

Other useful GCC debug commands:

p debug_rtl_list (INSN, N)
where INSN is an instruction RTX.  This will print N insns.

p debug_tree (TREE)
where TREE is a tree variable will print out the tree struct.

p operands[0]
will print operands[0] as a C struct.

ptype operands[0]
will show the RTX type details.  This is useful for figuring
out how to set a conditional break that will check for "reg:DI 95".

> ../seed48_r.i: In function 'main':
> ../seed48_r.i:1: error: unrecognizable insn:
> (insn 9 8 10 1 (set (reg:DI 95)
>         (plus:DI (reg:DI 96)
>             (const_int -6547 [0xffffffffffffe66d]))) -1 (nil)
>     (expr_list:REG_EQUAL (const_int 25214903917 [0x5deece66d])
>         (nil)))
> ../seed48_r.i:1: internal compiler error: in extract_insn, at recog.c:2084
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <URL:http://gcc.gnu.org/bugs.html> for instructions.
> 
> Program exited with code 01.
> (gdb) 

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
