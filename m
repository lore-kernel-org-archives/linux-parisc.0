Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CEE5482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 10:49:39 -0600 (MDT)
Sender: Jes.Sorensen@cern.ch
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
References: <200104130702.BAA30672@puffin.external.hp.com>
From: Jes Sorensen <jes@linuxcare.com>
Date: 13 Apr 2001 18:49:37 +0200
In-Reply-To: Grant Grundler's message of "Fri, 13 Apr 2001 01:02:15 -0600"
Message-ID: <d3ae5krbha.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Grant" == Grant Grundler <grundler@puffin.external.hp.com> writes:

Grant> Jes Sorensen wrote:
>> Then Linus changed his mind. You are still *only* supposed to use
>> readb/writeb on PCI (and possible ISA) on PCI like devices.

Grant> Jes, AFAIK, STI devices will all be memory mapped devices.
Grant> readb/writeb will do the right thing since GSC is "PCI-like" in
Grant> this regard.

I still don't like it as it is misleading.

Jes
