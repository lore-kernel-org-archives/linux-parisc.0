Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4B63482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Feb 2003 05:29:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18hqaA-00021I-00; Sun, 09 Feb 2003 12:29:14 +0000
Date: Sun, 9 Feb 2003 12:29:13 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20030209122913.G27544@parcelfarce.linux.theplanet.co.uk>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com> <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <20030209031014.GD19683@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209031014.GD19683@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sat, Feb 08, 2003 at 08:10:14PM -0700
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

On Sat, Feb 08, 2003 at 08:10:14PM -0700, Grant Grundler wrote:
> Just drop that in debian/patches before building the debs.
> That patch applies clean to the binutils for unstable.
> I don't even pretend to understand how to properly build
> debian packages, much less binutils or "cross release" builds.
> That's why I made the tarball for "testing".

OK.  It's not really hard, but I don't mind doing it.  It's not like
this is a regular occurrence.  It's building now; when I've finished
I'll upload it to unofficial-debs and people will be able to apt-get
install it from there.

> I don't care to find out the hard way.
> I'd rather just comply with the architecture and not worry about it.
> If someone can demonstrate a perf advantage or issue, I'll be
> more receptive.

Sure.  When someone's trying to implement futexes, this may prove critical..

> > One final point.... up till now, we've been telling people it's OK to
> > run kernels configured for PA1.1 on PA2.0 processors.  This patch says
> > to me that's not safe.
> 
> Only for SMP. I think for UP the rule still holds.

Agree.  That was implicit in the kernel list i gave later, but I should've
stated it explicitly.

> Unfortunately yes.
> 
> OTOH, PA20 SMP still hasn't proven stable so maybe it's not worth
> doing at the moment either.  Once PA20 SMP is stable, we could drop
> the 64-bit UP kernels since most systems that *require* 64-bit are SMP.

Sure, but there's a measurable performance difference if you compile out
spinlocks

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
