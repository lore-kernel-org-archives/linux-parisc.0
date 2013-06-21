From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] parisc stable patches for v3.9.x
Date: Fri, 21 Jun 2013 08:39:23 -0700
Message-ID: <20130621153923.GB14059@kroah.com>
References: <20130620215429.GA18879@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: stable@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130620215429.GA18879@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jun 20, 2013 at 11:54:29PM +0200, Helge Deller wrote:
> Hi Greg,
> 
> could you please queue up the following upstream commits (in this order)
> for the next v3.9.x stable kernel?
> 
> 9372450cc22d185f708e5cc3557cf991be4b7dc5 parisc: add kernel stack overflow check
> 200c880420a2c02a0899120ce52d801fad705b90 parisc: implement irq stacks
> cd85d5514d5c4d7e78abac923fc032457d0c5091 parisc: more irq statistics in /proc/interrupts
> 0fc537d1d655cdae69b489dbba46ad617cfc1373 parisc: tlb flush counting fix for SMP and UP
> 1ab4ce762370b82870834899e49c08129d7ae271 parisc: remove the second argument of kmap_atomic()
> 416821d3d68164909b2cbcf398e4ba0797f5f8a2 parisc: implement irq stacks - part 2 (v2)
> 949451b9b19da5e998778eb78929aafc73b5c227 parisc: add rp5470 entry to machine database
> d0c3be806a3fe7f4abdb0f7e7287addb55e73f35 parisc: show number of FPE and unaligned access handler calls in /proc/interrupts
> b63a2bbc0b9b106a93e11952ab057e2408f2eb02 parisc: make interrupt and interruption stack allocation reentrant
> d96b51ec14650b490ab98e738bcc02309396e5bc parisc: fix irq stack on UP and SMP
> 3f108de96ba449a8df3d7e3c053bf890fee2cb95 parisc: memory overflow, 'name' length is too short for using
> ae249b5fa27f9fba25aa59664d4338efc2dd2394 parisc: fix kernel BUG at arch/parisc/include/asm/mmzone.h:50
> 766039022a480ede847659daaa78772bdcc598ae parisc: rename "CONFIG_PA7100" to "CONFIG_PA7000"
> ea99b1adf22abd62bdcf14b1c9a0a4d3664eefd8 parisc: kernel: using strlcpy() instead of strcpy()
> 4edb38695d9a3cd62739f8595e21f36f0aabf4c2 parisc: parport0: fix this legacy no-device port driver!
> 91ea8207168793b365322be3c90a4ee9e8b03ed4 parisc: fix kernel BUG at arch/parisc/include/asm/mmzone.h:50 (part 2)
> 9a66d1869d90f13fbaf83dcce5b1aeec86fbc699 parisc: fix serial ports on C8000 workstation
> 2cc7138f4347df939ce03f313e3d87794bab36f8 parisc: provide pci_mmap_page_range() for parisc
> 
> Those backports are necessary for the parisc architecture to reach a
> similiar stability and security level as upstream v3.10 will have (for
> example, without the irq stack we crashed badly because of stack
> overflows).
> 
> All source files touched are only used by the parisc architecture.

All now applied, thanks.

greg k-h
