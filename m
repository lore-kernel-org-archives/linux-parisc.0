From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sat, 10 Apr 2010 18:53:56 -0400
Message-ID: <20100410225355.GA2812@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100409151330.GA23889@hiauly1.hia.nrc.ca> <4BC0E3AD.4050802@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BC0E3AD.4050802@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 10 Apr 2010, Helge Deller wrote:

> Nevertheless, on my B2000 (32bit, SMP, 2.6.32.2 kernel) I still do see the minifail bug.
> The only difference seems to be, that the minifail3 program doesn't get stuck any
> more. It still crashes though from time to time...

There are some issues with your minifail3.c testcase.  The fork'd child
shouldn't do any I/O and it should exit using _exit(0).  Otherwise, it
can corrupt the I/O structures of the parent.  I'm not sure that this
is the issue on your B2000, but it's worth a try.

The testcase when modified as above doesn't crash on my c3750 (32bit, UP,
2.6.32.2 kernel).

I found in debugging this testcase that the crash was always associated
with the stack region for thread_run.  I put a big loop in thread_run.
The index for the loop when compiled at -O0 is constantly being saved
and restored on the stack.  I found that crashes occured after many
iterations of the loop.  Nothing else was going on.

The COW discussion convinced me that cache flushing was the problem.
The fork (clone) syscall causes the stack region used by thread_run
to become COW'd.  When thread_run is scheduled, the loop caused an
instant COW break and stack corruption.  The state of the stack region
generally returned to its state before the fork.

If the above doesn't fix the testcase on your B2000, there must be
some difference and other PA8000 machines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
