Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CB1F4840
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Jan 2004 12:45:33 -0700 (MST)
Date: Fri, 23 Jan 2004 12:45:31 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE pb: followup
Message-ID: <20040123194531.GA30221@colo.lackof.org>
References: <20040122053112.GB6468@colo.lackof.org>
	<400D3BEE0000294D@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <400D3BEE0000294D@ocpmta1.freegates.net>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 23, 2004 at 07:54:44PM +0100, Joel Soete wrote:
> >AFAIK, the memcpy just enables the PDC to use a serial console.
> 
> Hmm we didn't 'relocate' PDC (as see hpux makes), so all those information
> are fill in by PDC prgm itself? So if Console is flagged CL_DUP, I don't
> see why do we have to make this memcpy?

I don't pretend to understand how PDC uses page zero.
Any takers on explaining what the memcopy does?

> >Anyway, Figuring out some additional info could help:
> >   (a) know which devices migh have DMA enabled when the OS gets control
> 
> May be the console itself (by continuously reading the kdb eg)?


> 
> >   (b) disable just the DMA
> where should I look to disable so console dma?

In the B2k's case the USB keyboard is the console input device
and USB does DMA. Right?
That means the console can not be active when we reprogram
the IOMMU.

If the console is the serial port, then we should be able to disable
just the USB device and not impact the Serial ports.

grant
