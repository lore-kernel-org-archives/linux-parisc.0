Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87CAF482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 16:56:03 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
References: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk> <d366gbrxgu.fsf@lxplus015.cern.ch> <20010411213458.D26010@parcelfarce.linux.theplanet.co.uk> <d31yqzrwtz.fsf@lxplus015.cern.ch> <20010411235104.A19570@parcelfarce.linux.theplanet.co.uk>
From: Jes Sorensen <jes@linuxcare.com>
Date: 12 Apr 2001 00:56:01 +0200
In-Reply-To: Matthew Wilcox's message of "Wed, 11 Apr 2001 23:51:04 +0100"
Message-ID: <d3wv8rqc5a.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:

Matthew> On Wed, Apr 11, 2001 at 10:43:52PM +0200, Jes Sorensen wrote:
>> Point is that readb/writeb are *only* defined for PCI and PCI
>> look-alike devices, even for ISA you're supposed to use
>> isa_readb/isa_writeb

Matthew> No, you're wrong.  isa_* are due to go away in 2.5.  After
Matthew> you've called ioremap(), you can call readb/writeb on the
Matthew> returned address.  You might want to refer to
Matthew> Documentation/IO-mapping.txt and/or
Matthew> Documentation/DocBook/deviceiobook.* (only in Alan's tree
Matthew> right now).

Then Linus changed his mind. You are still *only* supposed to use
readb/writeb on PCI (and possible ISA) on PCI like devices.

Jes
