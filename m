Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C26ED4890
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 21 Jan 2004 22:31:13 -0700 (MST)
Date: Wed, 21 Jan 2004 22:31:12 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE pb: followup
Message-ID: <20040122053112.GB6468@colo.lackof.org>
References: <400CB89F00001978@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <400CB89F00001978@ocpmta2.freegates.net>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Jan 21, 2004 at 07:03:05PM +0100, Joel Soete wrote:
> Hi all,
> 
> On the my b2k when I add 'CONFIG_PDC_CONSOLE' the system hang just after
> "Searching for devices..." leting the led CDROM continuously bright ???
> 
> With some printk, I reach to figure out that is at the pdc_suspend_usb()
> point where the boot hang. I try to bypass this and so it boot well.

yup - that's fixed in 2.6 slightly better.
Look for pdc_io_reset_devices() in drivers/parisc/sba_iommu.c.
You can backport and test that change to 2.4, I'd be happy to apply it.

The problem is if suckyio USB (or any device) is still doing DMA when
we reprogram the IOMMU, it will cause an HPMC. The reason is we
are fundementally changing how DMA works (non-coherent to coherent)
and PDC doesn't reprogram the suckyIo USB accordingly.
C3000 (and related systems) provides a special PDC call to disable USB.
"ccio" (eg C200) systems can have the same problem with LAN boot.

> I also try to bypass this memcpy (and restore pdc_suspend_usb() call) and
> it boot also well.

I think you've just prevented either PDC or Linux from using a PDC device.

> In sumary, on the b2k, this early memcpy() seems to break something in the
> later pdc_suspend_usb() call.

It's the other way around. pdc_suspend_usb() is breaking PDC_CONSOLE.
See email related to linux-2.6 c3000 serial console problems late last year.

AFAIK, the memcpy just enables the PDC to use a serial console.
But pdc_suspend_usb() apperently blows away the whole suckyio chip
and thus PDC can no longer use suckyio serial either. Hrmm..I thought
there was a IO_RESET_AND_CLEAR pdc call in that same chunk of code.

Anyway, Figuring out some additional info could help:
   (a) know which devices might have DMA enabled when the OS gets control
   (b) disable just the DMA
   (c) detect when PDC_CONSOLE wants to use a device whose DMA we've disabled


hth
grant
