Return-Path: <lamont@mmjgroup.com>
Received: from mmjgroup.com (mmjgroup.com [192.34.35.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 363C94875
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 17:30:06 -0700 (MST)
Date: Tue, 16 Dec 2003 17:30:01 -0700
From: LaMont Jones <lamont@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Question about cache flushing and fork
Message-ID: <20031217003001.GG25535@mmjgroup.com>
References: <20031216160301.GC25535@mmjgroup.com>
	<200312162251.hBGMpd15018573@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200312162251.hBGMpd15018573@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Dec 16, 2003 at 05:51:38PM -0500, John David Anglin wrote:
> > On Tue, Dec 16, 2003 at 12:06:57AM -0500, John David Anglin wrote:
> Is it possible to do PDC calls from user space under hpux to determine
> cache parameters?

The architecture requires that pdc calls be done at ring 0, with PSW.D=0,
so no.  Having said that, many of the interesting return values are
available from the kernel, either through sysconf or (sigh) /dev/kmem.

> I revised GCC's trampoline code to assume a line length of 32 instead
> of 64 on hppa64.  It can now flush arbitrarily long regions of memory.
> The test now passes.  This seems to imply that the cache length of a
> C200 under hpux11.00 is 32 bytes.

Cache line size is fixed on every CPU that I've seen, so OS shouldn't
matter...  One can assume a 16-byte cache line and it will work everywhere,
of course, although at 1/2 or 1/4 speed in many cases.  AFAIK, all PA1.1
machines use at least a 32 byte cache-line.

lamont
