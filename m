From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Tue, 5 May 2009 14:40:43 -0400
Message-ID: <20090505184043.GC3094@bombadil.infradead.org>
References: <20090505172228.GB3094@bombadil.infradead.org> <20090505181750.5792A4EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090505181750.5792A4EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, May 05, 2009 at 02:17:49PM -0400, John David Anglin wrote:
> > (gdb) 
> > #0  0x0002b3ec in __canonicalize_funcptr_for_compare ()
> > #1  0x00026010 in sys_rt_sigaction (tcp=0x4e060) at ../signal.c:1886
> > #2  0x00017b10 in trace_syscall (tcp=0x4e060) at ../syscall.c:2553
> > #3  0x00016c98 in main (argc=<value optimized out>, argv=0xbff8202c)
> >     at ../strace.c:2475
> > 
> > which is:
> > 
> >                 if (sa.__sigaction_handler.__sa_handler == SIG_ERR)
> >                         tprintf("{SIG_ERR, ");
> 
> Is __canonicalize_funcptr_for_compare choking on SIG_ERR?  This is
> a special value (-1).  The plabel bit is set.
> 

Ahh, brilliant. Casting to long fixed it.

cheers, Kyle
