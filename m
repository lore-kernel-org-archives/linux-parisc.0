Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id A90A2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 11:03:27 -0600 (MDT)
Sender: drepper@cygnus.com
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>,
	Matt Taggart <taggart@carmen.fc.hp.com>, randolph@tausq.org,
	lamont@hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rpc.lockd hangs  (was Re: portmap deb)
References: <20010406210401.7685C37CDB@carmen.fc.hp.com>
	<20010407001500.Z9198@linuxcare.com>
	<20010408202046.B19712@parcelfarce.linux.theplanet.co.uk>
	<20010409105606.C5790@linuxcare.com>
	<20010409152125.A15015@parcelfarce.linux.theplanet.co.uk>
	<20010410150351.N6992@linuxcare.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 10 Apr 2001 09:58:57 -0700
In-Reply-To: Richard Hirst's message of "Tue, 10 Apr 2001 15:03:51 +0100"
Message-ID: <m3snjghesu.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst <rhirst@linuxcare.com> writes:

> No, doesn't work, because INLINE_SYSCALL() does
> 
>                 asm volatile(                                   \
>                         "ble  0x100(%%sr2, %%r0)\n\t"   \
>                         " ldi %1, %%r20"                        \
>                         : "=r" (__res)                          \
>                         : "i" (SYS_ify(name)) ASM_ARGS_##nr     \
>                          );                                     \
> 
> while INLINE_SYSCALL_NR needs
> 
>                 asm volatile(                                   \
>                         "ble  0x100(%%sr2, %%r0)\n\t"   \
>                         " copy %1, %%r20"                       \
>                         : "=r" (__res)                          \
>                         : "r" (sysnum) ASM_ARGS_##nr            \
>                          );                                     \

Why should you need two macros?  The second one is not used on any
other architecture and therefore no non-machine specific code uses it.
Get rid of it.  If you only use it to implement syscall() do it right
and don't hide it in a macro.  Even though we have many macros this
does not mean this is the way code should always be written.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
