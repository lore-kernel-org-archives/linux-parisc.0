Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD56E488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 24 Jan 2004 14:03:21 -0700 (MST)
Date: Sat, 24 Jan 2004 14:03:20 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE pb: followup
Message-ID: <20040124210320.GA16272@colo.lackof.org>
References: <20040122053112.GB6468@colo.lackof.org>
	<400D3BEE0000294D@ocpmta1.freegates.net>
	<20040123194531.GA30221@colo.lackof.org>
	<40125302.5050600@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40125302.5050600@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Jan 24, 2004 at 11:12:02AM +0000, Joel Soete wrote:
> >If the console is the serial port, then we should be able to disable
> >just the USB device and not impact the Serial ports.
> 
> hmm afaik usb ports on a b2k (and I presume for the same family) are just 
> there (iirc the user guide and spec) to be used only for usb kbd and mouse

I think that's all PDC and HPUX know how to talk to.
That's all HP will support or warrant.

But it's a USB port and if other devices work, use it.

> and so if no usb kbd was found by pdc we could just disable usb at all?

The problem is USB is doing DMA and was enabled by PDC.
I don't care what's connected (Keyboard vs digital camera).

grant
