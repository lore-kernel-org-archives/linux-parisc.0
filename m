Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DB1B482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 14:30:23 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
References: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk>
From: Jes Sorensen <jes@linuxcare.com>
Date: 11 Apr 2001 22:30:09 +0200
In-Reply-To: Matthew Wilcox's message of "Wed, 11 Apr 2001 21:13:37 +0100"
Message-ID: <d366gbrxgu.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:

Matthew> I'd like someone to test these out for me -- they compile but
Matthew> I'm monitorless here.

Matthew>  * Turn gsc_read/write[bwl] calls into read/write[bwl] *

Question, does this STI device appear on PCI/ISA cards?

Jes
