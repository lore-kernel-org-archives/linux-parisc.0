Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4ED884839
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jul 2003 10:31:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19ZYtn-0000m6-8s; Mon, 07 Jul 2003 17:31:31 +0100
Date: Mon, 7 Jul 2003 17:31:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: Marcelo Tosatti <marcelo@conectiva.com.br>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	Matthew Wilcox <willy@debian.org>,
	HPPA List <parisc-linux@parisc-linux.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030707163131.GB23597@parcelfarce.linux.theplanet.co.uk>
References: <3F03A42100000903@ocpmta1.freegates.net> <1057593949.2749.59.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1057593949.2749.59.camel@dhcp22.swansea.linux.org.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Marcelo, looks like you have a problem to sort out:

--- ../marcelo-2.4/include/linux/sysctl.h       Thu Jul  3 08:59:18 2003
+++ include/linux/sysctl.h      Mon Jul  7 10:19:02 2003
@@ -124,28 +127,36 @@
        KERN_CORE_USES_PID=52,          /* int: use core or core.%pid */
        KERN_TAINTED=53,        /* int: various kernel tainted flags */
        KERN_CADPID=54,         /* int: PID of the process to notify on CAD */
-       KERN_CORE_PATTERN=56,   /* string: pattern for core-files */
-       KERN_PPC_L3CR=57,       /* l3cr register on PPC */
-       KERN_EXCEPTION_TRACE=58, /* boolean: exception trace */
+       KERN_PIDMAX=55,         /* int: PID # limit */
+       KERN_CORE_PATTERN=56,   /* string: pattern for core-file names */
+       KERN_PANIC_ON_OOPS=57,  /* int: whether we will panic on an oops */
 };

Bad PPC people.  And bad KERN_EXCEPTION_TRACE people, whoever they are.
The PPC one needs to be changed, no matter what.  And the KERN_EXCEPTION
people need to get a sysctl number allocated by Linus.

Looks like the VM people have been naughty too:

-       VM_MAX_MAP_COUNT=11,    /* int: Maximum number of active map areas */
-       VM_MIN_READAHEAD=12,    /* Min file readahead */
-       VM_MAX_READAHEAD=13,    /* Max file readahead */
+       VM_DIRTY_BACKGROUND=11, /* dirty_background_ratio */
+       VM_DIRTY_RATIO=12,      /* dirty_ratio */
+       VM_DIRTY_WB_CS=13,      /* dirty_writeback_centisecs */
+       VM_DIRTY_EXPIRE_CS=14,  /* dirty_expire_centisecs */
+       VM_NR_PDFLUSH_THREADS=15, /* nr_pdflush_threads */
+       VM_OVERCOMMIT_RATIO=16, /* percent of RAM to allow overcommit in */
+       VM_PAGEBUF=17,          /* struct: Control pagebuf parameters */
+       VM_HUGETLB_PAGES=18,    /* int: Number of available Huge Pages */
+       VM_SWAPPINESS=19,       /* Tendency to steal mapped memory */
+       VM_LOWER_ZONE_PROTECTION=20,/* Amount of protection of lower zones */
+       VM_MIN_FREE_KBYTES=21,  /* Minimum free kilobytes to maintain */

SCTP is bad too:

-       NET_KHTTPD=17
+       NET_SCTP=17, 


On Mon, Jul 07, 2003 at 05:05:52PM +0100, Alan Cox wrote:
> On Llu, 2003-07-07 at 17:00, Joel Soete wrote:
> > > Get the HP ones into 2.5 then they are fixed "right" values
> > 
> > Ok but now in 2.4.22-pre3:
> > [...]
> >   	KERN_EXCEPTION_TRACE=58,	/* boolean: exception trace */
> > [...]
> 
> Same comment still applies. The 2.5. ones are definitive. If someone
> submits a 2.4 one clashing with a different 2.5 one tell Marcelo to
> revert it ASAP.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
