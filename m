Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA01479
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 09:55:32 -0700
Received: from user-137-160.jakinternet.co.uk (HELO rhirst.linuxcare.com) (212.187.137.160)
  by mailserv2.iuinc.com with SMTP; 21 Nov 2000 16:57:43 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A906FB007; Tue, 21 Nov 2000 16:54:42 +0000 (GMT)
Date: Tue, 21 Nov 2000 16:54:42 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] signal handling problems (32 bit kernel)
Message-ID: <20001121165442.Y32715@linuxcare.com>
References: <20001120175838.Q32715@linuxcare.com> <Pine.LNX.4.21.0011211713550.15623-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0011211713550.15623-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Tue, Nov 21, 2000 at 06:05:36PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 21, 2000 at 06:05:36PM +1100, Alan Modra wrote:
> > and then in another terminal do 'kill -USR1 <pid>'.  The program
> > either goes 'Wah!', gives a SEGV, or works.  That seems to be because
> > %r1 is corrupted while processing the signal.  The signal handler ends
> > with a syscall (rt_sigreturn_wrapper), and %r1, at least, is not saved
> > and restored over the syscall.  %r31 also appears to get corrupted, as
> > it is used in the final branch of the syscall return.
> 
> I don't really understand what is going on here, but it seems wrong to me
> that setup_rt_frame should be touching regs->iaoq at all when in_syscall.

Problem is that whenever a signal handler is invoked, it is followed
by a sys_rt_sigreturn syscall (invoked via the trampoline code), before
returning to original usercode.  I can imagine that this might work if
the process in question was blocked on a syscall, but not if it was
suspended due to an interrupt.  In either case the path back to the
original user code is the syscall return path, and that obviously cannot
put things back as they were if the process was interrupted.

I think the answer is for syscall_do_signal to save enough in the
pt_regs such that sys_rt_sigreturn_wrapper can return to userland
via an RFI (like intr_restore, but remembering to trace the syscall
exit if necessary) regardless of the process state when the signal
occurred.

Richard
