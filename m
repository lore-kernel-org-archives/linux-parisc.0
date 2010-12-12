From: Guy Martin <gmsoft@tuxicoman.be>
Subject: 2.6.36 regression : swap support broken
Date: Sun, 12 Dec 2010 19:38:56 +0100
Message-ID: <20101212193856.15f93ea4@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: eike-kernel@sf-tec.de
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi all,


Recently, swap got broken. When it has to be used, the kernel issue the
following line numerous times :
swap_free: Bad swap offset entry 00100009

It eventually panic with useless backtrace. Note that the offset entry
is always the same number.

This can be reproduced easily by booting with mem=64m and start
compiling something like the kernel.


I've been bisecting this and I found out it has been introduced in
4e60c86bd9e5a7110ed28874d0b6592186550ae8 and to be precise, the
following change in include/linux/mmdebug.h :
-#define VM_BUG_ON(cond) do { } while (0)
+#define VM_BUG_ON(cond) do { (void)(cond); } while (0)


While the above change looks harmless, it introduces a slight change in
mm/swap_state.c:154 in add_to_swap() : VM_BUG_ON(!PageUptodate(page));
If you comment out that line, the problem is gone.

PageUptodate() will call smp_rmb() being the memory barrier instruction.

Those tests were done with linux-2.6.36 and gcc-4.4.4.
Having the feeling that this might have been a gcc bug, I recompiled
the whole kernel with gcc-4.2.4 and the problem was gone.

Looking at the assembly output for add_to_swap(), there is a slight
difference.

- gcc-4.4.4 output :

add_to_swap:
        .PROC
        .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=4
        .ENTRY
        stw %r2,-20(%r30)
        stw,ma %r4,64(%r30)
        stw %r3,-60(%r30)
        ldw 0(%r26),%r28
        copy %r26,%r3
        ldw 0(%r26),%r28
        bb,>=,n %r28,28,.L61
.L61:   
        b,l get_swap_page,%r2
        ...


- gcc-4.2.4 output :

add_to_swap:
        .PROC
        .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=4
        .ENTRY
        stw %r2,-20(%r30)
        stw,ma %r4,64(%r30)
        stw %r3,-60(%r30)
        ldw 0(%r26),%r19
        copy %r26,%r3
        ldw 0(%r26),%r28
        extrw,s,>= %r28,28,1,%r0
.L76:   
        b,l get_swap_page,%r2
        ...

As you can see, gcc-4.2 uses extrw while gcc-4.4 uses bb.

What's the next step in order to troubleshoot this ?
Is this really a gcc bug or is the problem elsewhere ?



HTH,
  Guy


