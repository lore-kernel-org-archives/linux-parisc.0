Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA05047
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 08:15:56 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 29 Aug 2000 14:15:57 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13TmAn-0002Lf-00; Tue, 29 Aug 2000 15:15:33 +0100
Date: Tue, 29 Aug 2000 15:15:33 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Thierry SIMONNET <t.simonnet@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linux-2.3 mkdep
Message-ID: <20000829151533.A6395@parcelfarce.linux.theplanet.co.uk>
References: <009601c01181$db5a8590$0a14d793@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <009601c01181$db5a8590$0a14d793@esiee.fr>; from t.simonnet@esiee.fr on Tue, Aug 29, 2000 at 08:24:59AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 29, 2000 at 08:24:59AM +0200, Thierry SIMONNET wrote:
> After my holidays, I synchronized my CVS directories.
> I have found a problem when I do "make dep" : scripts/mkdep : Arg list too
> long.
> I have encoutered this problem with fist versions of parisc-linux 2.3.99
> version.

oh, blast.  i guess we need to refrob the Makefile to use xargs.  Damn,
damn damn damn.  I took that out in the recent merge because it conflicted
with a change from upstream.

> My development platform was : HP712/80 under HP-UX 10.20

i can't persuade you to use linux on an x86 instead...?  ah well :-)
