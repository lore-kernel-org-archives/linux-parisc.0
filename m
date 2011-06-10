From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Stuck gnat1 processes
Date: Thu, 9 Jun 2011 23:01:35 -0400
Message-ID: <20110610030134.GA7699@hiauly1.hia.nrc.ca>
References: <20110610013034.GA5353@hiauly1.hia.nrc.ca> <BANLkTim57hUshC5Uaeojn9nzCxy23UE=Xg@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTim57hUshC5Uaeojn9nzCxy23UE=Xg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 09 Jun 2011, Carlos O'Donell wrote:

> This looks like a combination of multiple bugs, the process is
> probably dead, or not running, which is why gdb can't do anything with
> it. I'm surprised the ptrace API isn't returning some more diagnostics
> about the stuck process.

Why do you think the processes are dead or not running?  Top thinks
they are running at 100% CPU.  The general system responsiveness
seemed like full load.

The backtraces indicated that a diagnostic report was in process of
being output.  The $r19 register appears to point to the expected location.
Possibly, there is a space register mixup but gdb doesn't show them
correctly.  I think x/x $r19 worked ok.

There is no indication that the processes are waiting for anything.

Gnat1 would normally do a compilation and exit.  I don't believe it
is multithreaded.

Strace showed nothing.  Gdb always attached at the same location.

It was possible to kill the processes, and then make terminated when
the last process was killed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
