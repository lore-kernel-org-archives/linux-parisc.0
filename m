From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: [RFC] Where to put arch-dependant locking in malloc/thread-m.h
Date: Fri, 26 Sep 2003 10:24:08 -0400
Message-ID: <20030926142408.GZ14406__7802.2293899723$1416622812$gmane$org@systemhalted>
References: <20030925211509.GY14406@systemhalted> <20030926133954.12328.qmail@md.dent.med.uni-muenchen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org
To: wmglo@dent.med.uni-muenchen.de
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030926133954.12328.qmail@md.dent.med.uni-muenchen.de>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Sep 26, 2003 at 01:39:54PM -0000, wmglo@dent.med.uni-muenchen.de wrote:
> > The following patch fixes the issue, but I'm not content about it's
> > placement in malloc/thread-m.h. Any comments about where I might put
> > this in order to make maintenance easier?
> 
> Ok, I have become convinced it is best to move thread-m.h into
> sysdeps.  We should rename it, too (my suggestion: malloc-machine.h),
> and make sure that one can put e.g.
> 
> #define DEFAULT_MMAP_THRESHOLD (256*1024)
> 
> in there and have it reflected in malloc.
> 
> I'll send a patch for this tomorrow.

Thank you. Sounds like the best solution in this case.

c.
