Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 808CD4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 20 Oct 2003 11:38:37 -0600 (MDT)
Date: Mon, 20 Oct 2003 13:34:40 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Message-ID: <20031020173440.GE32666@systemhalted>
References: <200310201631.h9KGVZ49001423@hiauly1.hia.nrc.ca> <200310201656.h9KGuAew001566@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310201656.h9KGuAew001566@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] fenv laid to rest, 50% done porting dbl-64 to ldbl-64, no testing yet.
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

On Mon, Oct 20, 2003 at 12:56:10PM -0400, John David Anglin wrote:
> > > Does having them both at the same time violates the behaviour of
> > > "feraiseexcept" in the ISO C standard (especially in the case of
> > > underflow)? If feraiseexcept is called and only an underflow 
> > > requested, but underflow and inexact are enabled, what then?
> > 
> > Does this help?  The standard says
> > 
> > "Whether the feraiseexcept function additionally raises the inexact
> > exception whenever it raises the overflow or underflow exceptions is
> > implementation defined."
> 
> Also, in F.7.6.2,
> 
> "If the argument to the feraiseexcept function in <fenv.h> represents
> IEC 60559 valid coincident exceptions for atomic operations (namely
> overflow and inexact, or underflow and inexact) then overflow or
> underflow is raised before inexact."

Yes, I have already taken this into account. Thanks for all the help
with spec interpretation. I appreciate the feedback. We pass all the
fenv tests in glibc, but still fail the long double support. I'm about
50% done porting dbl-64 to ldbl-64, might get done in the next few 
weeks. It would finally give us a functioning long double :)

c.
