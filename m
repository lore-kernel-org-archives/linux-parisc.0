From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 15:40:50 -0400
Message-ID: <119aab441003281240m6be2cedeh3b8ce77d39d095be@mail.gmail.com>
References: <20100328190701.20C0C516B@hiauly1.hia.nrc.ca>
	 <20100328193147.015054E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328193147.015054E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 28, 2010 at 3:31 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> The bad value is stored here:
>>
>> 0x0003f578 <fork+700>: =A0 =A0 =A0 =A0ldil L%7b800,r26
>> 0x0003f57c <fork+704>: =A0 =A0 =A0 =A0b,l 0x35d74 <_IO_list_unlock>,=
rp
>> 0x0003f580 <fork+708>: =A0 =A0 =A0 =A0stw r19,-414(r6)
>> (gdb) p/x $r19
>> $2 =3D 0x10101364
>
> %r19 is clobbered by the clone syscall:

This is a known issue with the kernel assembly, fork, vfork, and clone
all clobber r19, which is why glibc saves/restore r19 across
syscalls... but only in the PIC case.

ARCH_FORK ->
  INLINE_SYSCALL (clone, 5,                                            =
 \
                  CLONE_CHILD_SETTID | CLONE_CHILD_CLEARTID | SIGCHLD, =
 \
                  NULL, NULL, NULL, &THREAD_SELF->tid)

INLINE_SYSCALL does:
                asm volatile(                                          =
 \
                        SAVE_ASM_PIC                                   =
 \
                        "       ble  0x100(%%sr2, %%r0)\n"             =
 \
                        "       ldi %1, %%r20\n"                       =
 \
                        LOAD_ASM_PIC                                   =
 \
                        : "=3Dr" (__res)                               =
   \
                        : "i" (SYS_ify(name)) PIC_REG_USE ASM_ARGS_##nr=
 \
                        : "memory", CALL_CLOB_REGS CLOB_ARGS_##nr      =
 \
                );                                                     =
 \

So r19 is saved/restored around the clone syscall, but *ONLY* if the
code is PIC.

Therefore in your non-PIC case it will corrupt r19.

Actually, looking at the fork/vfork/clone wrappers in entry.S they
clobber two registers:

        /* These are call-clobbered registers and therefore
           also syscall-clobbered (we hope). */
        STREG   %r2,PT_GR19(%r1)        /* save for child */
        STREG   %r30,PT_GR21(%r1)

It would appear that r21 is also clobbered.

Does this mean that we need to either (a) fix the kernel to stop
clobbering r19 and r21 or fix userspace?

I'm inclined to think the kernel is wrong, and lazy here, and pt_regs
should have another PT_GR2_CHILD and PT_GR30_CHILD entries for the
case above.

Comments?

> (gdb) disass 0x0003f44c 0x0003f458
> Dump of assembler code from 0x3f44c to 0x3f458:
> 0x0003f44c <fork+400>: =A0be,l 100(sr2,r0),sr0,r31
> 0x0003f450 <fork+404>: =A0ldi 78,r20
> 0x0003f454 <fork+408>: =A0nop
>
> Breakpoint 5, 0x0003f44c in fork ()
> (gdb) p/x $r19
> $6 =3D 0x0
>
> Breakpoint 4, 0x0003f454 in fork ()
> (gdb) p/x $r19
> $7 =3D 0x10101364
>
> Same value for %r19 is returned for both parent and child.
>
> This is using application linked with -static (i.e., libc.a). =A0Prob=
ably,
> shared lib is different.

I hope my explanation above shows why r19 is clobbered.

I hadn't thought about the static case and a non-PIC register use of r1=
9.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
