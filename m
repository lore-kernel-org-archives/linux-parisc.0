Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id A95F948AE
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 24 Jan 2004 04:09:59 -0700 (MST)
Message-ID: <40125302.5050600@tiscali.be>
Date: Sat, 24 Jan 2004 11:12:02 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE pb: followup
References: <20040122053112.GB6468@colo.lackof.org>
	<400D3BEE0000294D@ocpmta1.freegates.net>
	<20040123194531.GA30221@colo.lackof.org>
In-Reply-To: <20040123194531.GA30221@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Grant,



Grant Grundler wrote:
> On Fri, Jan 23, 2004 at 07:54:44PM +0100, Joel Soete wrote:
> 
>>>AFAIK, the memcpy just enables the PDC to use a serial console.
>>
>>Hmm we didn't 'relocate' PDC (as see hpux makes), so all those information
>>are fill in by PDC prgm itself? So if Console is flagged CL_DUP, I don't
>>see why do we have to make this memcpy?
> 
> 
> I don't pretend to understand how PDC uses page zero.
> Any takers on explaining what the memcopy does?
> 
> 
>>>Anyway, Figuring out some additional info could help:
>>>  (a) know which devices migh have DMA enabled when the OS gets control
>>
>>May be the console itself (by continuously reading the kdb eg)?
> 
> 
> 
>>>  (b) disable just the DMA
>>
>>where should I look to disable so console dma?
> 
> 
> In the B2k's case the USB keyboard is the console input device
> and USB does DMA. Right?

ok (if a usb kbd is connected ;) )

> That means the console can not be active when we reprogram
> the IOMMU.
> 
> If the console is the serial port, then we should be able to disable
> just the USB device and not impact the Serial ports.

hmm afaik usb ports on a b2k (and I presume for the same family) are just there
(iirc the user guide and spec) to be used only for usb kbd and mouse
and so if no usb kbd was found by pdc we could just disable usb at all?

Thanks again for info and patience,
	Joel
