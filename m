From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [PATCH] Generic BUG for parisc
Date: Sun, 10 Dec 2006 21:38:33 +0800
Message-ID: <457C0DD9.20004__28078.8238197148$1416624228$gmane$org@tausq.org>
References: <200612091628.38777.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <randolph@tausq.org>
In-Reply-To: <200612091628.38777.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

> Since I would like to submit this patch to our tree, I would like to get your feedback first:
> - Is the "break" instruction the best one for this task ?

Yes, i think so.

> - will it affect runtime of the kernel (maybe break statements, although normally not executed, reduce throughput ?)

I think the way you have it is fine, the break traps only when executed, 
so it should not affect normal execution.

> - should I submit it as soon as our parisc-tree has the necessary bits from mainline ?
> - any other ideas ?

The only thing I noticed is that your patch has various "cleanups" or 
maybe just whitespace changes that is mixed it. It's not a big deal, but 
maybe it'll be cleaner if those are separated out.

> One idea I had was to encode the file line number into the instruction itself (in im5 & im13), since the break instruction is implemented as "break im5, im13" and 16bit fit easily in there.
> This would save some space, but I would need to add some ifdefs in the generic implementation which I didn't wanted to touch yet.

Please don't do this. It will make things confusing.

Note that there are some other tools that use the break infrastructure, 
and some of them will be in kernel space. For example, kdb uses "break" 
to implement breakpoints. If we implement tools like kprobes, they will 
probably need to use "break" too. We need to have unique break numbers 
if these tools were to coexist. For reference, the parisc kdb 
implementation uses the following:

+#define KDB_BREAK_BREAK 0x111          /* kdb breakpoint in kernel */
+#define KDB_BREAK_ENTER 0x112          /* KDB_ENTER() */
+
+#define PA_BREAK_INSN(n)       ((n)<<13)
+#define KDB_BREAK_BREAK_INSN   PA_BREAK_INSN(KDB_BREAK_BREAK)
+#define KDB_BREAK_ENTER_INSN   PA_BREAK_INSN(KDB_BREAK_ENTER)
+
+#define KDB_ENTER2(b)  asm("\tbreak 0,"#b"\n")
+#define KDB_ENTER1(b)  KDB_ENTER2(b)
+#define KDB_ENTER()    KDB_ENTER1(KDB_BREAK_ENTER)

my 2 cents :)
randolph
