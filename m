Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D1EF482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 10:48:31 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
References: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk> <d366gbrxgu.fsf@lxplus015.cern.ch> <20010411213458.D26010@parcelfarce.linux.theplanet.co.uk> <d31yqzrwtz.fsf@lxplus015.cern.ch> <20010411235104.A19570@parcelfarce.linux.theplanet.co.uk> <d3wv8rqc5a.fsf@lxplus015.cern.ch> <20010412003606.A20002@parcelfarce.linux.theplanet.co.uk>
From: Jes Sorensen <jes@linuxcare.com>
Date: 13 Apr 2001 18:48:28 +0200
In-Reply-To: Matthew Wilcox's message of "Thu, 12 Apr 2001 00:36:06 +0100"
Message-ID: <d3eluwrbj7.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:

Matthew> On Thu, Apr 12, 2001 at 12:56:01AM +0200, Jes Sorensen wrote:
>> Then Linus changed his mind. You are still *only* supposed to use
>> readb/writeb on PCI (and possible ISA) on PCI like devices.

Matthew> I've heard this before.  But no-one ever came up with an
Matthew> example of what _was_ `PCI-like'.  Since right now our writeb
Matthew> is #defined to gsc_writeb, that leads me to believe GSC is
Matthew> sufficiently PCI-like.

Well time to go study the bus behaviors and compare them then. How
does gsc behave wrt cache coherency, read-around-write, write ordering
etc etc.

Using writeb on a gsc is misleading everybody else who reads the code
into believing that it's a PCI device.

Jes
