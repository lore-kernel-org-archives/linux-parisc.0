Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AE2D482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 17:36:13 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14nU9e-00064b-00; Thu, 12 Apr 2001 00:36:06 +0100
Date: Thu, 12 Apr 2001 00:36:06 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Jes Sorensen <jes@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
Message-ID: <20010412003606.A20002@parcelfarce.linux.theplanet.co.uk>
References: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk> <d366gbrxgu.fsf@lxplus015.cern.ch> <20010411213458.D26010@parcelfarce.linux.theplanet.co.uk> <d31yqzrwtz.fsf@lxplus015.cern.ch> <20010411235104.A19570@parcelfarce.linux.theplanet.co.uk> <d3wv8rqc5a.fsf@lxplus015.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d3wv8rqc5a.fsf@lxplus015.cern.ch>; from jes@linuxcare.com on Thu, Apr 12, 2001 at 12:56:01AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Apr 12, 2001 at 12:56:01AM +0200, Jes Sorensen wrote:
> Then Linus changed his mind. You are still *only* supposed to use
> readb/writeb on PCI (and possible ISA) on PCI like devices.

I've heard this before.  But no-one ever came up with an example of what
_was_ `PCI-like'.  Since right now our writeb is #defined to gsc_writeb,
that leads me to believe GSC is sufficiently PCI-like.

-- 
Revolutions do not require corporate support.
