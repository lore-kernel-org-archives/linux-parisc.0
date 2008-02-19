From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [patch 4/4] RFC: PCI: consolidate several
	pcibios_enable_resources() implementations
Date: Tue, 19 Feb 2008 17:31:07 +1100
Message-ID: <1203402667.6740.94.camel@pasglop>
References: <20080219043952.845136014@ldl.fc.hp.com>
	 <20080219044307.878416912@ldl.fc.hp.com>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-pci@atrey.karlin.mff.cuni.cz, linux-arch@vger.kernel.org,
	Russell King <rmk@arm.linux.org.uk>,
	linux-arm-kernel@lists.arm.linux.org.uk,
	Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
	linuxppc-dev@ozlabs.org, Chris Zankel <chris@zankel.net>
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080219044307.878416912@ldl.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Mon, 2008-02-18 at 21:39 -0700, Bjorn Helgaas wrote:
>     powerpc: has a different collision check at (5)

I've always found the collision check dodgy. I tend to want to keep
the way powerpc does it here.

pci_enable_device() should only enable resources that have successfully
been added to the resource tree (that have passed all the collision
check etc...). There is a simple & clear indication of that: res->parent
is non-NULL. I think that is a better check than the test x86 does on
start and end.

That is, whatever the arch code decides to use to decide whether
resources are assigned by firmware or by the first pass assignment code
or not and collide or not, once that phase is finished (which is the
case when calling pcibios_enable_device(), having the resource in the
resource-tree or not is, I believe, the proper way to test whether it's
a useable resource.

Ben.
