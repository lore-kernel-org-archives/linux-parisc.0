Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA12427
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 04:54:16 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 11:56:49 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id E8957B005; Wed,  6 Dec 2000 11:52:03 +0000 (GMT)
Date: Wed, 6 Dec 2000 11:52:03 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Message-ID: <20001206115203.Q7166@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa64 gcc sizeof() bug?
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,
  The following shows the compiler getting confused over the size
of a struct.  This is with a gcc/binutils built since the last
fix you did for me.

Richard


[rhirst@rhirst play]$ cat tc.c


typedef unsigned int u32;
#define NULL ((void *)0)

struct kernel_sym32 {
        u32 value;
        char name[60];
};

extern int sys_get_kernel_syms(void *);
extern int thing(struct kernel_sym32 *table);

int sys32_get_kernel_syms(struct kernel_sym32 *table)
{
        int len, i;

        len = sizeof (struct kernel_sym32);
        for (i = 0; i < len; i++, table += sizeof (struct kernel_sym32)) {
                if (thing(table))
                        break;
        }
        return i;
}


[rhirst@rhirst play]$ hppa64-linux-gcc -S -o tc.s -O2 tc.c
[rhirst@rhirst play]$ cat tc.s


        .LEVEL 2.0w
gcc2_compiled.:
        .text
        .align 8
.globl sys32_get_kernel_syms
                .type            sys32_get_kernel_syms,@function
sys32_get_kernel_syms:
        .PROC
        .CALLINFO FRAME=128,CALLS,SAVE_RP,ENTRY_GR=6
        .ENTRY
        std %r2,-16(%r30)
        ldo 128(%r30),%r30
        std %r6,-128(%r30)
        ldi 64,%r6		<<< Good, struct is 64 bytes
        std %r5,-120(%r30)
        ldi 0,%r5
        std %r4,-112(%r30)
        copy %r27,%r4
        std %r3,-104(%r30)
        copy %r26,%r3
.L3:
        copy %r3,%r26
        ldo 4096(%r3),%r3	<<< BAD struct is not 4096 bytes!
        cmpb,<= %r6,%r5,.L4
        ldo -16(%r30),%r29
        b,l thing,%r2
        nop
        copy %r4,%r27
        cmpib,= 0,%r28,.L5
        ldo 1(%r5),%r19
.L4:
        copy %r5,%r28
        ldd -144(%r30),%r2
        ldd -120(%r30),%r5
        ldd -112(%r30),%r4
        ldd -104(%r30),%r3
        bve (%r2)
        ldd,mb -128(%r30),%r6
.L5:
        b .L3
        extrd,s %r19,63,32,%r5
        .EXIT
        .PROCEND
.Lfe1:
        .size   sys32_get_kernel_syms,.Lfe1-sys32_get_kernel_syms
        .ident  "GCC: (GNU) 2.96 20000925 (experimental)"
[rhirst@rhirst play]$ 
