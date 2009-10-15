From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: poll(), illegal instruction and crash on smp kernel
Date: Thu, 15 Oct 2009 11:48:51 -0400
Message-ID: <119aab440910150848y1fe3464bq30b4ae1bb44d23ac@mail.gmail.com>
References: <4AD649BC.3080905@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>,
	Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AD649BC.3080905@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Oct 14, 2009 at 5:59 PM, Helge Deller <deller@gmx.de> wrote:
> Program received signal SIGILL, Illegal instruction.
> [Switching to Thread 0x8001 (LWP 22707)]
> 0x405e06fc in poll () from /lib/libc.so.6
> (gdb) bt
> #0 =A00x405e06fc in poll () from /lib/libc.so.6
> #1 =A00x41bb45a0 in __pthread_manager () from /lib/libpthread.so.0
> #2 =A00x41bb4e4c in __pthread_manager_event () from /lib/libpthread.s=
o.0
> #3 =A00x405eb340 in clone () from /lib/libc.so.6
> #4 =A00x00000010 in ?? ()
> #5 =A00x00000010 in ?? ()
> Backtrace stopped: previous frame identical to this frame (corrupt st=
ack?)
> (gdb)

If this happens again please provide the /proc/$PID/maps, it's
invaluable to mapping that libc address to an instruction.

> dmesg shows:
>
> [557116.676000] User Fault on Kernel Space pid=3D22910 command=3D'kon=
queror'

That's correct we tried to read kernel space.

build-tools/disasm says the faulting instruction is:
   0:   40 51 bc c8     ldb 1e64(sr2,rp),r17

I would have expect a SIGSEGV for that (trying to read from kernel
space sr2) instruction, but perhaps we deliver SIGILL in that case.

> [557116.676000] IASQ: 00001283 00001283 IAOQ: 0070a703 0070a707
> [557116.676000] =A0IIR: 4051bcc8 =A0 =A0ISR: 00000000 =A0IOR: 405e254=
3
> [557116.676000] =A0CPU: =A0 =A0 =A0 =A01 =A0 CR30: 8fed4000 CR31: fff=
fffff
> [557116.676000] =A0ORIG_R28: 00000000
> [557116.676000] =A0IAOQ[0]: 0070a703
> [557116.676000] =A0IAOQ[1]: 0070a707
> [557116.676000] =A0RP(r2): 405e06df
>
> Does this sound familiar to anybody here?
> Does this backtrace help?

No idea, but the instruction "4051bcc8" (see IIR in dump) doesn't
exist in libc.so.6 for 2.9-27. Something corrupted memory, and it
corrupted a read-only .text mapping. The only thing that can do that
is the kernel.

This is pretty much 100% a kernel bug?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
