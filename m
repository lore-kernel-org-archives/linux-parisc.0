From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: [PATCH] parisc: Remove unused pcibios_init_bus()
Date: Tue, 1 Dec 2015 14:02:11 -0800
Message-ID: <CAP6odjgr8va4nM2+Rr9gchkg28TctB-yd_n3reitwcUo=nmbCQ@mail.gmail.com>
References: <20151201164147.18471.52359.stgit@bhelgaas-glaptop2.roam.corp.google.com>
	<565E06C6.3080707@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Grant Grundler <grundler@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <565E06C6.3080707@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 1, 2015 at 12:44 PM, Helge Deller <deller@gmx.de> wrote:
> On 01.12.2015 17:41, Bjorn Helgaas wrote:
>> There are no callers of pcibios_init_bus(), so remove it.
>
> True, pcibios_init_bus() isn't called anywhere, so it should be removed.
>
> But I wonder if we might need to initialize latency and parity for PCI-PCI
> bridges somewhere else then?

pcibios_fixup_bus() appears to do that...but I don't know the call chain.
I used cscope to look for PCI_BRIDGE_CTL_PARITY.

> In one of my machines I have a i960 based RAID controller which isn't working
> yet (I think it's internally based on a PCI-PCI bridge), and maybe this
> is the reason it doesn't work? I will need to test it (e.g. firmware doesn't
> fully initializes PCI-PCI bridges, which is why this code was added once).

If lspci doesn't show the PCI-PCI bridge, the i960 RAID card is using
that internally.
parisc (and any other architecture) should discover and configure all
PCI-PCI bridges already.

I know it did for the "multifunction" cards I had available 10 years ago.

cheers,
grant
