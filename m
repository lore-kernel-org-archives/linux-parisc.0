Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA05570
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Sep 2000 14:54:10 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 27 Sep 2000 20:54:58 -0000
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] floating point exception error
References: <20000927195500.57241381CD@carmen.fc.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 27 Sep 2000 16:41:38 -0400
In-Reply-To: Matt Taggart's message of "Wed, 27 Sep 2000 13:55:00 -0600"
Message-ID: <873dilo9dp.fsf@tarwebok.i-did-not-set--mail-host-address--so-shoot-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart <taggart@carmen.fc.hp.com> writes:

> In trying to build mawk I ran into a bug when the configure tried to test 
> "floating point exceptions". Attached is the output. BTW- the gawk does 
> something similar at the same point in it's configure.

Some additional info, since I'm aware of this bug:

The problem here is that the SIGFPE is not being delivered when the
test program expects it to be (the test program here being fpe_check.c
in the mawk sources).

First the program tries to generate divide-by-zero and overflow
exceptions.  I don't think the former ends up generating an exception,
but the latter does.  However this exception does not occur
immediately due to the odd 'deferred trapping' that the PA-RISC FPU
does.  The program then goes on to do some other stuff (testing
representation of NaN), which it does not expect to trap.  The next
floating point instruction occurs in maybe_nan(), and causes the
delayed trap to occur.

Since its SIGFPE handler does 'longjmp' to a place after where each
exception was expected to occur, this means the process jumps
backwards to the overflow test, and then loops endlessly doing this.

I don't understand the mechanics of FPU exceptions on PA-RISC at all.
The delayed trapping scheme and multiple exception registers are weird
to say the least - all machines I've seen in the past are either
totally imprecise like older Alphas, or deliver one exception at a
time, synchronously, the way that user code expects them to.

We probably need more complicated FPU trap logic in the kernel in
order to deliver exceptions in the proper POSIX and IEEE manner.  I
would appreciate it if someone from HP could comment on this - how
does HP/UX handle this?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
