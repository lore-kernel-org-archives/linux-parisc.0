Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA24926
	for <parisc-linux@puffin.external.hp.com>; Sun, 29 Aug 1999 14:00:42 -0600
From: emolitor@molitor.org
Received: from cpu209-41-104-129.unicomp.net (HELO linux.molitor.org) (root@209.41.104.129)
  by mailserv2.iuinc.com with SMTP; 29 Aug 1999 20:02:27 -0000
Received: from localhost (emolitor@localhost)
	by linux.molitor.org (8.9.3/8.9.3) with ESMTP id PAA01389;
	Sun, 29 Aug 1999 15:00:38 -0500
Date: Sun, 29 Aug 1999 15:00:38 -0500 (CDT)
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] keyboard driver
In-Reply-To: <19990829201550.K493@mencheca.ch.genedata.com>
Message-ID: <Pine.LNX.4.10.9908291456360.1379-100000@linux.molitor.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 29 Aug 1999, Matthew Wilcox wrote:

> On Sat, Aug 28, 1999 at 10:30:32PM -0500, emolitor@molitor.org wrote:
> > 
> > Hello all, I recently was given a 715/50 to play around with. Its
> > got an old version of HP/UX running on it and I am getting ready to dump
> > that and look into programming a bit on parisc-linux. Any direction on
> > what can be persued?
> > 
> > Of course my current goal is to get the kernel to cross-compile and then
> > boot from a zip drive... (Looking for that It works message...)
> 
> For a start, don't ditch the HP/UX it has running on it unless you have
> another HP/UX box around to compile kernels with.  Right now, we need to
> use the HP linker.
> 

hmmm, ok, looks like I'll have to reinstall HP/UX. That's ok, I need to do
a little (Ok, a lot) of research on the PARisc architecture to get
familiar with it.

> The kernel as it stands right now probably won't boot on your 715/50.
> I'm waiting for Philipp to sort out a couple of problems and then I'm
> going to try to track down why it doesn't boot on my 715/33; the kernel
> I checked out a week ago wouldn't boot until I put in debugging printks.
> grr.
> 

I am amazed at every hacker who has a full head of hair... (facial hair
does not count...)
