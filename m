Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA11913
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 22:39:50 -0700
Date: Wed, 17 Nov 1999 05:49:37 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: frowand@cup.hp.com
Cc: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] use of (*PAGE0->mem_pdc)()
Message-Id: <19991117054937.E750@mathe.stud.uni-erlangen.de>
References: <382F3C94.BFF3EB9D@uswest.net> <38309328.A734C736@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <38309328.A734C736@hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> >   pret = (*PAGE0->mem_pdc)(
> >   PDC_BLOCK_TLB,
> >   PDC_BTLB_INSERT,

> I would recommend that we quit using the pointer to PDCE_PROC() that
> is in page zero, because the newer machines have a PDC procedure,
> PDC_RELOCATE(), that copies PDCE_PROC into real memory, where it
> executes much faster.  The page zero pointer to PDCE_PROC() is not
> updated by PDC_RELOCATE(), but instead a pointer to the in-memory
> PDCE_PROC() is returned.
> 
> I recommend using a global variable to hold the pointer to PDCE_PROC(),
> which would be the value from page zero initially, then updated to
> the value returned by PDC_RELOCATE().

Not only is it is a potential performance problem to use (PAGE0->mem_pdc),
it's arguably ugly and problematic for SMP as well.  There is an interface
in place to call pdc (even for real-mode code now) and there shouldn't be
a problem using that.

	Philipp Rumpf
