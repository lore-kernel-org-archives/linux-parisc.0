Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB98F4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 13:08:28 -0600 (MDT)
Date: Mon, 20 Oct 2003 15:04:30 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fenv laid to rest, 50% done porting dbl-64 to ldbl-64, no testing yet.
Message-ID: <20031020190430.GF32666@systemhalted>
References: <20031020173440.GE32666@systemhalted> <200310201749.h9KHnHQ3001830@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310201749.h9KHnHQ3001830@hiauly1.hia.nrc.ca>
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

On Mon, Oct 20, 2003 at 01:49:17PM -0400, John David Anglin wrote:
> > Yes, I have already taken this into account. Thanks for all the help
> > with spec interpretation. I appreciate the feedback. We pass all the
> > fenv tests in glibc, but still fail the long double support. I'm about
> > 50% done porting dbl-64 to ldbl-64, might get done in the next few 
> > weeks. It would finally give us a functioning long double :)
> 
> I think we should hold off on implementing this until we get a final
> decision from HP on whether they will release their quadlib or not.

Noted. I have reordered my hacking queue.

a- Generate new testing deb's for glibc
	= Includes providing debian with a new .dpatch
	(1-2 days)
b- Fix _r_debug.r_map loader problems.
	(Timeline unknown)
c- Finish light-weight kernel syscalls for atomic ops
	(A few weeks)
d- Continue implementing ldbl-64 based on dbl-64.
	= The first 50% was a "test the waters" patch.
	= It looks *very* feasible and easy to test.
	= Function renaming, rewriting, casting, and mangling.
	(A few weeks)

In parallel with my usual upstream pushes.

If HP gets up off their haunches before I get to "d-" then they win :),
else I will continue my work on ldbl-64. I *will* hold-off on the
release of such an implementation in favour of the 128-bit ldbl. I know
full well that once we release the ldbl-64 it will become our ABI.

c.
