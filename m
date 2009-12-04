From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: make hangs reading pipe
Date: Thu, 3 Dec 2009 21:02:05 -0500
Message-ID: <119aab440912031802u72b7c679uf8cfa47d8c77f27f@mail.gmail.com>
References: <20091203011435.5401D4FA3@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091203011435.5401D4FA3@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 2, 2009 at 8:14 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> (gdb) bt
> #0 =A00x4098607c in read () from /lib/libc.so.6
> #1 =A00x0001eb6c in ?? ()
> #2 =A00x0001ec4c in ?? ()
> #3 =A00x00021af0 in main ()
> (gdb) disass 0x4098606c 0x4098608c
> Dump of assembler code from 0x4098606c to 0x4098608c:
> 0x4098606c <read+24>: =A0 cmpib,<>,n 0,ret0,0x409860a0 <read+76>
> 0x40986070 <read+28>: =A0 copy r19,r3
> 0x40986074 <read+32>: =A0 be,l 100(sr2,r0),sr0,r31
> 0x40986078 <read+36>: =A0 ldi 3,r20

Those last two instructions are the "read" syscall. The process is
just waiting for the kernel to deliver data, but it never came. The PC
points to 0x4098607c, which is where the process will *return* after
the read syscall completes.

When you see a "be,l 100" it's a syscall, when you see a "be,l b0"
it's a light-weight-syscall.

> 0x4098607c <read+40>: =A0 ldi -1000,r1
> 0x40986080 <read+44>: =A0 cmpb,>>=3D,n r1,ret0,0x40986100 <read+172>
> 0x40986084 <read+48>: =A0 copy r3,r19
> 0x40986088 <read+52>: =A0 b,l 0x409a7c38,rp
> End of assembler dump.

You need to use sysrq-t to determine why the other side of the pipe is =
stuck.

> dave@hiauly6:/proc/4506$ cat status
> Name: =A0 make
> State: =A0S (sleeping)

Sleeping is normal, it's blocked waiting for the read to complete.

> lr-x------ 1 dave dave 64 Nov 29 11:00 3 -> pipe:[23677]
> lr-x------ 1 dave dave 64 Nov 29 11:00 7 -> pipe:[23678]
>
> Processes 23677 and 23678 are non existant.

Those are the kernel inode numbers for the anonymous pipe. You need to
look for the other pid which is writing to the pipe of the same inode.

If the process on the other side of the pipe dies shouldn't the fd's
get closed and then make's read on the pipe should return with partial
data followed by EOF?

> In the current hang, I see:
>
> dave@hiauly6:/proc/23324/fd$ ls -l
> total 0
> l-wx------ 1 dave dave 64 Dec =A02 19:49 0 -> /dev/null
> l-wx------ 1 dave dave 64 Dec =A02 19:49 1 -> /home/dave/gnu/gcc-4.5/=
objdir/build.log
> l-wx------ 1 dave dave 64 Dec =A02 19:49 2 -> /home/dave/gnu/gcc-4.5/=
objdir/build.log
> lr-x------ 1 dave dave 64 Dec =A02 19:49 3 -> pipe:[1383769]
> lr-x------ 1 dave dave 64 Dec =A02 19:49 6 -> /home/dave/gnu/gcc-4.5/=
gcc-4.5
> lr-x------ 1 dave dave 64 Dec =A02 19:49 7 -> pipe:[1383770]
>
> Not sure what the pipe numbers mean...

Each anonymous pipe gets an inode number in the pipefs filesystem,
which you can't see or mount.

> The current hang could be debugged more if anybody has further ideas.
> Any thoughts?

Yes, it's not make's fault, it's waiting for the read to complete.
What is the process on the other side of the pipe?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
