Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6817E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 08:02:56 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CC8A8B008; Tue, 10 Apr 2001 15:03:51 +0100 (BST)
Date: Tue, 10 Apr 2001 15:03:51 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, randolph@tausq.org,
	lamont@hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rpc.lockd hangs  (was Re: portmap deb)
Message-ID: <20010410150351.N6992@linuxcare.com>
References: <20010406210401.7685C37CDB@carmen.fc.hp.com> <20010407001500.Z9198@linuxcare.com> <20010408202046.B19712@parcelfarce.linux.theplanet.co.uk> <20010409105606.C5790@linuxcare.com> <20010409152125.A15015@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010409152125.A15015@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Mon, Apr 09, 2001 at 03:21:25PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 09, 2001 at 03:21:25PM +0100, Matthew Wilcox wrote:
> On Mon, Apr 09, 2001 at 10:56:06AM +0100, Richard Hirst wrote:
> > INLINE_SYSCALL wants a name, and an arg count, not a syscall number, eg:
> > 
> >   INLINE_SYSCALL(nfsservctl, 3, cmd, argp, resp);
> > 
> > so passing a syscall number in to syscall() doesn't work, and also
> > syscall() won't know how many arguments there are to pass on to
> > INLINE_SYSCALL.  Maybe we could just use '6' to get round that.
> 
> Yep, that's my thinking.
> 
> > Maybe we duplicate INLINE_SYSCALL in sysdeps/unix/sysv/linux/hppa/sysdep.h,
> > call the new one INLINE_SYSCALL_NR, and replace 'SYS_ify(name)' with 'name'.
> > Then have
> > 
> > int syscall(int nr, int arg1, int arg, int arg3, int arg4, int arg5, int arg6)
> > {
> >       return INLINE_SYSCALL_NR(nr, arg1, arg2, arg3, arg4, arg5, arg6);

That would need a '6' as well:

	return INLINE_SYSCALL_NR(nr, 6, arg1, arg2, arg3, arg4, arg5, arg6)

> umm..
> 
> #define INLINE_SYSCALL(name, args...) INLINE_SYSCALL_NR(SYS_ify(name), args)

No, doesn't work, because INLINE_SYSCALL() does

                asm volatile(                                   \
                        "ble  0x100(%%sr2, %%r0)\n\t"   \
                        " ldi %1, %%r20"                        \
                        : "=r" (__res)                          \
                        : "i" (SYS_ify(name)) ASM_ARGS_##nr     \
                         );                                     \

while INLINE_SYSCALL_NR needs

                asm volatile(                                   \
                        "ble  0x100(%%sr2, %%r0)\n\t"   \
                        " copy %1, %%r20"                       \
                        : "=r" (__res)                          \
                        : "r" (sysnum) ASM_ARGS_##nr            \
                         );                                     \

note the ldi --> copy and "i" --> "r".

I think we need to duplicate INLINE_SYSCALL rather than define one in terms
of the other.

The next question then is where to put the 'C' version of syscall().  Other
archs have a syscall.S (as do we, but ours will now be empty).  For now I've
put in it sysdep.c, that lives in the same dir as syscall.S and sysdep.h,
where INLINE_SYSCALL is defined.  Is that acceptable do you think?
Or do I have to replace syscall.S with syscall.c (which will mean
understanding the build process rather better than I currently do)?

> Otherwise, agreed.  This seems like a more robust approach than doing it
> in assembler directly, and I don't believe it will be significantly less
> efficient.  syscall() is clearly only used in exceptional cases anyway.

OK, although other ports have syscall as asm in syscall.S.

> Since these packages have clearly never worked up till now, this seems
> like an opportune point to change the sizes of these structures if that's
> needed in order to get these syscalls implemented efficiently on 32 &
> 64 bit.

Good point.

Richard
