Return-Path: <carlos@baldric.uwo.ca>
Received: from fep02-mail.bloor.is.net.cable.rogers.com
	(fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A5994840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  3 Feb 2004 18:01:46 -0700 (MST)
Date: Tue, 3 Feb 2004 19:57:08 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] [PATCH] gcc/config/pa/ftpr.c fixes for new
	TRAMPOLINE_TEMPLATE in hppa's glibc.
Message-ID: <20040204005707.GE13520@baldric.uwo.ca>
References: <20040131222832.GB19840@baldric.uwo.ca>
	<20040203055045.GC11884@baldric.uwo.ca>
	<16416.12461.599235.278205@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <16416.12461.599235.278205@gargle.gargle.HOWL>
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > >     the template should it be necessary to change the current branch
> > >     position.  */
> > >  #define NOFFSETS 2
>                      ^^^ ?
> > > -static int fixup_branch_offset[NOFFSETS] = { 32, -4 };
> > > +static int fixup_branch_offset[NOFFSETS] = { 36, 32, -4 };

Yes, that should be a '3'.
I'll revise that.

Thanks Matthias! 

c.
