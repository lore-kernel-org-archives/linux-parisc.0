Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Patch: linux-2.5.47/drivers/parisc/ - pci_dma_supported had side effect 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Sat, 16 Nov 2002 23:20:25 MST." <20021117062025.A10E8482E@dsl2.external.hp.com>
References: <20021116054941.A3448@baldur.yggdrasil.com>  <20021117062025.A10E8482E@dsl2.external.hp.com> 
Date: Sat, 16 Nov 2002 23:52:32 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021117065232.2DA8F482E@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Grant Grundler wrote:
> I think pci_dma_supported() is obsoleted by pci_set_dma_mask().

nope, it hasn't.
pci_set_dma_mask() in fact calls pci_dma_supported().
I haven't look at that code in a while...

grant
