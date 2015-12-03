From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Remove unused pcibios_init_bus()
Date: Thu, 3 Dec 2015 17:05:20 +0100
Message-ID: <56606840.6090004@gmx.de>
References: <20151201164147.18471.52359.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <565E06C6.3080707@gmx.de>
 <CAP6odjgr8va4nM2+Rr9gchkg28TctB-yd_n3reitwcUo=nmbCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Grant Grundler <grundler@parisc-linux.org>
To: Grant Grundler <grantgrundler@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAP6odjgr8va4nM2+Rr9gchkg28TctB-yd_n3reitwcUo=nmbCQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01.12.2015 23:02, Grant Grundler wrote:
> On Tue, Dec 1, 2015 at 12:44 PM, Helge Deller <deller@gmx.de> wrote:
>> On 01.12.2015 17:41, Bjorn Helgaas wrote:
>>> There are no callers of pcibios_init_bus(), so remove it.
>>
>> True, pcibios_init_bus() isn't called anywhere, so it should be removed.
>>
>> But I wonder if we might need to initialize latency and parity for PCI-PCI
>> bridges somewhere else then?
> 
> pcibios_fixup_bus() appears to do that...but I don't know the call chain.
> I used cscope to look for PCI_BRIDGE_CTL_PARITY.
> 
>> In one of my machines I have a i960 based RAID controller which isn't working
>> yet (I think it's internally based on a PCI-PCI bridge), and maybe this
>> is the reason it doesn't work? I will need to test it (e.g. firmware doesn't
>> fully initializes PCI-PCI bridges, which is why this code was added once).

machine model : 9000/800/L3000-8x
model name    : Marcato W+ (rp5470)

> If lspci doesn't show the PCI-PCI bridge, the i960 RAID card is using
> that internally.

lspci does see the PCI-PCI bridge:

50:00.0 PCI bridge: Intel Corporation 80960RP (i960RP) Microprocessor/Bridge (rev 02) (prog-if 00 [Normal decode])
        Flags: medium devsel
        Bus: primary=50, secondary=51, subordinate=51, sec-latency=0
        I/O behind bridge: 00000000-00000fff
        Memory behind bridge: 94400000-944fffff
        Prefetchable memory behind bridge: 94500000-945fffff
        Capabilities: [68] Power Management version 2

50:00.1 I2O: Intel Corporation 80960RP (i960RP) Microprocessor (rev 02) (prog-if 01)
        Subsystem: Hewlett-Packard Company Device 1228
        Flags: medium devsel, IRQ 71
        Memory at ffffffff94000000 (32-bit, prefetchable) [disabled] [size=4M]
        [virtual] Expansion ROM at ffffffff94600000 [disabled] [size=32K]
        Capabilities: [80] Power Management version 2


sec-latency is listed in the lspci output above as "sec-latency=0", so do we maybe need to add this part somewhere ?
-	/* PCI-PCI bridge - set the cache line and default latency
-	   (32) for primary and secondary buses. */
-	pci_write_config_byte(dev, PCI_SEC_LATENCY_TIMER, 32);

> parisc (and any other architecture) should discover and configure all
> PCI-PCI bridges already.
> I know it did for the "multifunction" cards I had available 10 years ago.

Boot log shows:
[    9.408000] Elroy version TR4.0 (0x5) found at 0xffffffff9fff4000
[    9.564000] LBA: Not a C8000 system - not extending LMMIO range.
[    9.568000] LBA: Not registering GMMIO space [mem 0xfffffff504000000-0xfffffff57fffffff]
[    9.684000] LBA 0:10: PCI host bridge to bus 0000:50
[    9.820000] pci_bus 0000:50: root bus resource [io  0x80000-0x8ffff] (bus address [0x0000-0xffff])
[    9.956000] pci_bus 0000:50: root bus resource [mem 0xffffffff94000000-0xffffffff95ffffff] (bus address [0x94000000-0x95ffffff])
[   10.092000] pci_bus 0000:50: root bus resource [bus 50-57]
[   10.096000] pci 0000:50:00.0: [8086:0964] type 01 class 0x060400
[   10.096000] pci 0000:50:00.1: [8086:1960] type 00 class 0x0e0001
[   10.096000] pci 0000:50:00.1: reg 0x10: [mem 0x00000000-0x003fffff pref]
[   10.096000] pci 0000:50:00.1: reg 0x30: [mem 0x00000000-0x00007fff pref]
[   10.096000] pci_bus 0000:51: busn_res: can not insert [bus 51-ff] under [bus 50-57] (conflicts with (null) [bus 50-57])
[   10.096000] pci 0000:50:00.0: PCI bridge to [bus 51-ff]
[   10.232000] pci 0000:50:00.0:   bridge window [io  0x80000-0x80fff]
[   10.232000] pci 0000:50:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   10.232000] pci 0000:50:00.0:   bridge window [mem 0x00000000-0x000fffff pref]
[   10.232000] pci 0000:50:00.0: can't claim BAR 14 [mem 0x00000000-0x000fffff]: no compatible bridge window
[   10.372000] pci 0000:50:00.0: can't claim BAR 15 [mem 0x00000000-0x000fffff pref]: no compatible bridge window
[   10.508000] pci 0000:50:00.0: can't claim BAR 16 [??? 0x00000000 flags 0x0]: no compatible bridge window
[   10.648000] pci_bus 0000:51: busn_res: [bus 51-ff] end is updated to 51
[   10.648000] pci 0000:50:00.0: BAR 16: [??? 0x00000000 flags 0x20000000] has bogus alignment
[   10.784000] pci 0000:50:00.1: BAR 0: assigned [mem 0xffffffff94000000-0xffffffff943fffff pref]
[   10.920000] pci 0000:50:00.0: BAR 14: assigned [mem 0xffffffff94400000-0xffffffff944fffff]
[   11.060000] pci 0000:50:00.0: BAR 15: assigned [mem 0xffffffff94500000-0xffffffff945fffff pref]
[   11.060000] pci 0000:50:00.1: BAR 6: assigned [mem 0xffffffff94600000-0xffffffff94607fff pref]
[   11.200000] pci 0000:50:00.0: PCI bridge to [bus 51]
[   11.336000] pci 0000:50:00.0:   bridge window [io  0x80000-0x80fff]
[   11.336000] pci 0000:50:00.0:   bridge window [mem 0xffffffff94400000-0xffffffff944fffff]
[   11.472000] pci 0000:50:00.0:   bridge window [mem 0xffffffff94500000-0xffffffff945fffff pref]

Helge

