Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40329482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 14:35:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14nRKM-0001Vz-00; Wed, 11 Apr 2001 21:34:58 +0100
Date: Wed, 11 Apr 2001 21:34:58 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Jes Sorensen <jes@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
Message-ID: <20010411213458.D26010@parcelfarce.linux.theplanet.co.uk>
References: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk> <d366gbrxgu.fsf@lxplus015.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d366gbrxgu.fsf@lxplus015.cern.ch>; from jes@linuxcare.com on Wed, Apr 11, 2001 at 10:30:09PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 11, 2001 at 10:30:09PM +0200, Jes Sorensen wrote:
> >>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:
> 
> Matthew> I'd like someone to test these out for me -- they compile but
> Matthew> I'm monitorless here.
> 
> Matthew>  * Turn gsc_read/write[bwl] calls into read/write[bwl] *
> 
> Question, does this STI device appear on PCI/ISA cards?

STI isn't a device, it's an interface.  STI applies to GSC, EISA & PCI
cards.  The particular chip (Artist) the driver deals with currently is
only on the GSC bus.  But we don't need to have gsc_read/write functions;
they will all go away eventually, I suspect.

-- 
Revolutions do not require corporate support.
