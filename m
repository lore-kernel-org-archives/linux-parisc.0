Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62004482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 08:35:01 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14mcXm-00066G-00; Mon, 09 Apr 2001 15:21:26 +0100
Date: Mon, 9 Apr 2001 15:21:25 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>,
	Matt Taggart <taggart@carmen.fc.hp.com>, randolph@tausq.org,
	lamont@hp.com, debian-buildd@list.parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rpc.lockd hangs  (was Re: portmap deb)
Message-ID: <20010409152125.A15015@parcelfarce.linux.theplanet.co.uk>
References: <20010406210401.7685C37CDB@carmen.fc.hp.com> <20010407001500.Z9198@linuxcare.com> <20010408202046.B19712@parcelfarce.linux.theplanet.co.uk> <20010409105606.C5790@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010409105606.C5790@linuxcare.com>; from rhirst@linuxcare.com on Mon, Apr 09, 2001 at 10:56:06AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 09, 2001 at 10:56:06AM +0100, Richard Hirst wrote:
> INLINE_SYSCALL wants a name, and an arg count, not a syscall number, eg:
> 
>   INLINE_SYSCALL(nfsservctl, 3, cmd, argp, resp);
> 
> so passing a syscall number in to syscall() doesn't work, and also
> syscall() won't know how many arguments there are to pass on to
> INLINE_SYSCALL.  Maybe we could just use '6' to get round that.

Yep, that's my thinking.

> Maybe we duplicate INLINE_SYSCALL in sysdeps/unix/sysv/linux/hppa/sysdep.h,
> call the new one INLINE_SYSCALL_NR, and replace 'SYS_ify(name)' with 'name'.
> Then have
> 
> int syscall(int nr, int arg1, int arg, int arg3, int arg4, int arg5, int arg6)
> {
>       return INLINE_SYSCALL_NR(nr, arg1, arg2, arg3, arg4, arg5, arg6);
> }

umm..

#define INLINE_SYSCALL(name, args...) INLINE_SYSCALL_NR(SYS_ify(name), args)

Otherwise, agreed.  This seems like a more robust approach than doing it
in assembler directly, and I don't believe it will be significantly less
efficient.  syscall() is clearly only used in exceptional cases anyway.

Since these packages have clearly never worked up till now, this seems
like an opportune point to change the sizes of these structures if that's
needed in order to get these syscalls implemented efficiently on 32 &
64 bit.

-- 
Revolutions do not require corporate support.
