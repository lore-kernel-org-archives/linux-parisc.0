Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 037E948ED
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 02:36:04 -0600 (MDT)
Date: Tue, 27 Apr 2004 09:35:56 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Linux-2.6.6-rc1-pa3 and Linux-2.6.6-rc2
In-Reply-To: <408D436000000590@ocpmta1.freegates.net>
Message-ID: <Pine.LNX.4.58.0404270915440.4406@sal.ucc.ie>
References: <408D436000000590@ocpmta1.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 27 Apr 2004, Joel Soete wrote:

> > and also the same symptoms as before (network is working normal, USB
> > keyboard/mouse don't work). If you respond fast what commands I should
> > run, I can give you more info ...
>
> hmm usb and ide seems to be on the same superio.

Also something other interesting:

I killed squid and all other processes that are trying to access /dev/hda,
so the kernel messages 'hda: lost interrupt' stopped (mostly) for now.
Also pdflush doesn't consume any (significant) CPU time anymore.

The system is quite stable again, but still no access to the serial
console login prompt, nor the USB devices are working. BTW, a
/proc/bus/usb/devices results in the following kernel message:

usb 2-1: control timeout on ep0in

... and the process hangs.

Attaching the USB keyboard/mouse to my PCI USB2.0 card suddenly gives that
kernel output:

Badness in ohci_endpoint_disable at drivers/usb/host/ohci-hcd.c:355
Kernel addresses on the stack:
 [<10125b48>] printk+0x188/0x1c8
 [<101063b8>] dump_stack+0x18/0x24
 [<10267970>] ohci_endpoint_disable+0xd0/0x1a0
 [<10121f70>] __wake_up_common+0x60/0xa8
 [<10257cf4>] hcd_endpoint_disable+0x114/0x1b8
 [<10121fd8>] __wake_up+0x20/0x38
 [<102592c8>] usb_disable_endpoint+0x80/0x88
 [<102593d4>] usb_disable_device+0x94/0xb4
 [<102536c4>] usb_disconnect+0x90/0x140
 [<10255d54>] hub_port_connect_change+0x2dc/0x2e0
 [<1025604c>] hub_events+0x2f4/0x39c
 [<10256150>] hub_thread+0x5c/0x128
 [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24


Another interesting thing is that I'm unable to kill -9 the X-Server.
Also I had some problems getting the Voodoo2 card working with custom
refresh rate settings; if I did specify a modeline in XF86Config-4
(generated with the fbset command), the machine would crash and print out
"bug in superio.c".
However if I use fbset after X has been started, it works perfectly.


Might be a Voodoo2 problem after all, who knows ...



And now for something completely different!



The Changelog to 2.6.6-rc2 contains the following:

=== snip ===

<dsaxena@plexity.net>
  [PATCH] PCI: Allow arch-specific pci_set_dma_mask and friends

  The patch provides the ability for architectures to have custom
  implementations of pci_set_dma_mask() and friends (dac_set_dma_mask
  and set_consistent_dma_mask). The reason I need this is b/c I have
  a chipset (Intel ARM IXP425) that has a broken PCI interface that
  only allows PCI dma to/from the bottom 64MB of system memory.  To get
  around this limitation, I trap a custom dma-mapping implementation that
  bounces buffers outside the 64MB window. At device discover time, my
  custom platform_notify() function gets called and it sets the dma_mask
  to (64MB-1) and in ARM's dma-mapping code, I check for dma_mask != 0xffffffff
  and if that is true, I call the special bounce helpers. This works great
  except that certain drivers (e100, ide-pci) call pci_set_dma_mask()
  with 0xffffffff and the generic implementation only allows for the
  architecture-defined pci_dma_supported() to return true or false. There
  is no method for the architecture to tell the PCI layer "I can't set
  the mask to 0xffffffff, but I can set it to this other value" and there
  is no way to pass that back to the driver. What this means is that if
  I have pci_set_dma_supported() return failure on full 32-bit DMA, the
  driver will not initialize the card; however, if I return true,
  pci_set_dma_mask() will set the dma mask to full 32-bits and I can no
  longer trap and will have buffers that are not dma-able and cause
  PCI master aborts.  Both of those are not acceptable.  IMHO, the
  driver shouldn't care if the architecture has to bounce DMA outside of
  64MB and since this is not something most architectures have to worry
  about, the easiest way to get around the issue is by allowing custom
  pci_set_dma_mask() for arches that need it but keeping the generic
  implementation for those that do not.  In my case, it simply returns
  0 to the driver but keeps the device mask set to 64MB-1 so I can trap.
=== snap ===

Since I still have problems to get onboard IDE DMA correctly working on my
C3000 (kernel and hdparm both say enabled, but just 3MB/s transfer rate
instead of >40 MB/s), and since any other PCI IDE card complains about
lost interrupts (on 2.6) or also behave like the onboard IDE (on 2.4),
I thought maybe this is related to the issue



Thanks for your help,
   Max
