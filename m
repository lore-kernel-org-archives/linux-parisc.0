Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA19908
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 02:17:24 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 20 Dec 2000 09:20:17 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D8EACB005; Wed, 20 Dec 2000 09:14:02 +0000 (GMT)
Date: Wed, 20 Dec 2000 09:14:02 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: David Huggins-Daines <dhd@eradicator.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] signal.c, etc
Message-ID: <20001220091402.C2554@linuxcare.com>
References: <87zohuhm30.fsf@cepstral.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87zohuhm30.fsf@cepstral.com>; from dhd@eradicator.org on Sun, Dec 17, 2000 at 02:41:39PM -0500
List-ID: <linux-parisc.vger.kernel.org>

Hi Dave,

On Sun, Dec 17, 2000 at 02:41:39PM -0500, David Huggins-Daines wrote:
> Hi,
> 
> Just reading through the archives, I noticed you came upon my rather
> hackish IAOQ manipulation in signal.c.
> 
> If you guys need any explanation about the intent of that code please
> ask me.  (I'm back on the parisc-linux list now, BTW)

Welcome back! Feel free to fix anything I broke.

> I freely admit that it is bogus (in fact that's why the comment was
> there), not because I didn't know which part of IAOQ was front and
> which was back, but because:
> 
> (a) There are two different signal exit paths, one from interruptions,
>     one from system calls.  This complicates things *tremendously*.
>     However, exiting from a signal handler always goes via system
>     calls, and in that case, the stored IAOQ values are meaningless.
>     I probably should have removed all the meaningless frobbings of
>     the stored IAOQ, but ... well ... time passes, you become occupied
>     elsewhere, etc.

Right, the code as was worked ok for the syscall case but broke
for the interrupt case.  The problem is that following the signal
and call to sys_rt_sigreturn, you need to return to userland either
via an interrupt return path, or a syscall return path, depending on
where you were when the signal occurred.  There is now a test in
syscall.S for __NR_rt_sigreturn in order to implement that.

> (b) I don't understand what the processor actually does when you
>     restore IAOQ on exit from an interruption.  The HP documentation
>     is not written in a particularly lucid manner.
> 
> (c) Setting iaoq_back to iaoq_front + 4 is *not* the right answer
>     because you may have taken an interruption in a branch, or an insn
>     may have been nullified, etc.

Absolutely - that was the main problem with the code as it was.
Seting iaoq_back to iaoq_front + 4 is valid if you are starting up the
signal handler, and should be ok if the singal occurred while you
were blocked on a syscall.

> (d) I had about ten billion other things to do at the time and was
>     under lots of pressure to get "more important things" working...

Sure - the current code does work for me under various test cases, but
it did take days to get to that point.

Richard
