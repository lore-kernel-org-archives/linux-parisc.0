Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2356B482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 09:50:00 -0700 (MST)
Message-Id: <200111191645.JAA18017@puffin.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: E55 status 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Sun, 18 Nov 2001 03:24:44 +0100." <3BF71BEC.5D032CE6@gmx.at>
Date: Mon, 19 Nov 2001 09:45:32 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Christoph Plattner wrote:
> I have rewritten my whole stuff on the current CVS snapshot from the end
> of this week (2.4.14-pa6).

wow! you've been busy...let's see if we can get that into
the CVS tree this time around...last May was a bad time to
introduce that.

...
> In general, the CONFIG stuff has to be adapted. On that stuff, my
> experience is not that what other LINUX hacker's expect ...

That can be sorted out if you post to the list.

> Further, is there a developer ChangeLog file to do entries per file ?

NAFAICT. CVS log serves that purpose.


> No SCSI controller is deteced, not the parallel interface,
> and the mulitplexer board. For these three componets, drivers are
> needed, and the DOCUMENTATION !!!

The documentation still hasn't been sanitized for publication.
Are you willing to sign an NDA that lets you publish code you write?

For us, that's the easiest way...anything else requires substantially
more work for our manager. He's busy enough already and no one
else inside HP has volunteered to review/clean the docs.

> I will add my current CVS diffings of my extensions very soon, at the
> moment the CVS server seems to be down!

cvs.p-l.org was never down.  Internet routing was broken Saturday AM PST.
Seems to be fixed and working again.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
