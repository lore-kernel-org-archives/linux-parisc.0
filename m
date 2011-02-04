From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.38-rc3 regression on parisc: segfaults
Date: Fri, 4 Feb 2011 10:07:03 -0500
Message-ID: <20110204150703.GA9254@hiauly1.hia.nrc.ca>
References: <20110203022420.A73F54E7B@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1102041150390.8218@math.ut.ee>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1102041150390.8218@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 04 Feb 2011, Meelis Roos wrote:

> 2363  clone( <unfinished ...>
> 2349  <... futex resumed> )             = 1
> 2363  <... clone resumed> child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x460df4a8) = 2372
> 2349  --- SIGSEGV (Segmentation fault) @ 0 (0) ---
> 2372  rt_sigaction(SIGPIPE, {SIG_DFL, [], SA_RESTART},  <unfinished ...>
> 2349  write(1, "\33[56;1H\33[34h\33[?25h", 18 <unfinished ...>
> 
> Something futex-related. Full log temprarilty available at 
> http://www.cs.ut.ee/~mroos/aptitude-strace.txt

This is possibly the infamous COW bug.

> gdb does not seem to work well:

I think the segv is in the dynamic loader.  Try gdb on dynamic loader
and aptitude as run argument.  Also suggest adding /usr/lib/debug to
LD_LIBRARY_PATH.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
