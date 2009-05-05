From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Tue, 5 May 2009 14:17:49 -0400 (EDT)
Message-ID: <20090505181750.5792A4EDA@hiauly1.hia.nrc.ca>
References: <20090505172228.GB3094@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, matthew@wil.cx, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090505172228.GB3094@bombadil.infradead.org> from "Kyle McMartin" at May 5, 2009 01:22:28 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> (gdb) 
> #0  0x0002b3ec in __canonicalize_funcptr_for_compare ()
> #1  0x00026010 in sys_rt_sigaction (tcp=0x4e060) at ../signal.c:1886
> #2  0x00017b10 in trace_syscall (tcp=0x4e060) at ../syscall.c:2553
> #3  0x00016c98 in main (argc=<value optimized out>, argv=0xbff8202c)
>     at ../strace.c:2475
> 
> which is:
> 
>                 if (sa.__sigaction_handler.__sa_handler == SIG_ERR)
>                         tprintf("{SIG_ERR, ");

Is __canonicalize_funcptr_for_compare choking on SIG_ERR?  This is
a special value (-1).  The plabel bit is set.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
