From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: E Class and SCSI (53c700 driver)
Date: Thu, 02 Apr 2015 14:58:04 +0300
Message-ID: <1427975884.3559.155.camel@HansenPartnership.com>
References: <5519CA2B.9060407@gmail.com> <551CF8D9.3020506@gmx.de>
	 <1427965174.3559.110.camel@HansenPartnership.com>
	 <BLU437-SMTP517D1501AE614C12AA19EC97F20@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>,
	Dmitry the Zuryanovich <dreadbit@gmail.com>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP517D1501AE614C12AA19EC97F20@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2015-04-02 at 07:43 -0400, John David Anglin wrote:
> On 2015-04-02, at 4:59 AM, James Bottomley wrote:
> 
> > The best docs we have:
> > 
> > https://parisc.wiki.kernel.org/images-parisc/5/52/E-class_hpjournal.pdf
> > 
> > Say the SCSI controller here is precision attached not lasi attached
> > (the ethernet is on the lasi, though).  Unfortunately, we don't have any
> > documents at all in the archive for the precision bus that I can find.
> 
> It's also known as HP-IB and quite a few devices were made to attach to it.  Maybe something
> can be found with Google.

Well, what do you know: HP has a computer museum full of obsolete
documentation.

http://www.hpmuseum.net/collection_document.php

If anyone can identify the programming specs for the HP-PB (or better
still the actual SCSI card) we might be in business.

James


