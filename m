Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 274F1482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 14:43:56 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
References: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk> <d366gbrxgu.fsf@lxplus015.cern.ch> <20010411213458.D26010@parcelfarce.linux.theplanet.co.uk>
From: Jes Sorensen <jes@linuxcare.com>
Date: 11 Apr 2001 22:43:52 +0200
In-Reply-To: Matthew Wilcox's message of "Wed, 11 Apr 2001 21:34:58 +0100"
Message-ID: <d31yqzrwtz.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:

Matthew> STI isn't a device, it's an interface.  STI applies to GSC,
Matthew> EISA & PCI cards.  The particular chip (Artist) the driver
Matthew> deals with currently is only on the GSC bus.  But we don't
Matthew> need to have gsc_read/write functions; they will all go away
Matthew> eventually, I suspect.

Point is that readb/writeb are *only* defined for PCI and PCI
look-alike devices, even for ISA you're supposed to use
isa_readb/isa_writeb

Jes
