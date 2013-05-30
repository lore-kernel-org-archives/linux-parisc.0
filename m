From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc/PCI: lba: fix: convert to pci_create_root_bus()
 for correct root bus resources
Date: Thu, 30 May 2013 21:47:11 +0200
Message-ID: <51A7ACBF.4030601@gmx.de>
References: <20130530141033.GA3665@ls3530.box> <CAErSpo69AxKgz8Dg8+T7n5jsuOzdSoCUstqrX+uUh8TZ08ayqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAErSpo69AxKgz8Dg8+T7n5jsuOzdSoCUstqrX+uUh8TZ08ayqg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Bjorn,

On 05/30/2013 08:04 PM, Bjorn Helgaas wrote:
> On Thu, May 30, 2013 at 8:10 AM, Helge Deller <deller@gmx.de> wrote:
>> This commit dc7dce280a26d069ad5a58bf3da86e5e83415c65
>> Author: Bjorn Helgaas <bhelgaas@google.com>
>> Date:   Fri Oct 28 16:27:27 2011 -0600
>>    parisc/PCI: lba: convert to pci_create_root_bus() for correct root bus
>>                     resources
>>
>>   Supply root bus resources to pci_create_root_bus() so they're correct
>>   immediately.  This fixes the problem of "early" and "header" quirks seeing
>>   incorrect root bus resources.
>>
>> forgot to set the IORESOURCE_BUS bus flag which led to incorrect resource
>> assignments and a non-working stifb framebuffer on most parisc machines.
>>
>> LBA 10:1: PCI host bridge to bus 0000:01
>> pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
>> pci_bus 0000:01: root bus resource [mem 0xfffffffffa000000-0xfffffffffbffffff] (bus address [0xfa000000-0xfbffffff])
>> pci_bus 0000:01: root bus resource [mem 0xfffffffff4800000-0xfffffffff4ffffff] (bus address [0xf4800000-0xf4ffffff])
>> pci_bus 0000:01: root bus resource [??? 0x00000001 flags 0x0]
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
>> index 2ef7103..29f3d7d 100644
>> --- a/drivers/parisc/lba_pci.c
>> +++ b/drivers/parisc/lba_pci.c
>> @@ -1494,7 +1494,7 @@ lba_driver_probe(struct parisc_device *dev)
>>
>>         pci_add_resource_offset(&resources, &lba_dev->hba.io_space,
>>                                 HBA_PORT_BASE(lba_dev->hba.hba_num));
>> -       if (lba_dev->hba.elmmio_space.start)
>> +       if (lba_dev->hba.elmmio_space.flags)
> 
> Commit dc7dce280a added this test of "elmmio_space.start", which
> indeed looks like it should be for "flags" instead.

Great!
Since I have no real knowledge about PCI, could you maybe comment on these
other ".start -> .flags" changes as well ?

--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -668,7 +668,7 @@ lba_fixup_bus(struct pci_bus *bus)
                        BUG();
                }
 
-               if (ldev->hba.elmmio_space.start) {
+               if (ldev->hba.elmmio_space.flags) {
                        err = request_resource(&iomem_resource,
                                        &(ldev->hba.elmmio_space));
                        if (err < 0) {
@@ -993,7 +993,7 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 
                case PAT_LMMIO:
                        /* used to fix up pre-initialized MEM BARs */
-                       if (!lba_dev->hba.lmmio_space.start) {
+                       if (!lba_dev->hba.lmmio_space.flags) {
                                sprintf(lba_dev->hba.lmmio_name,
                                                "PCI%02x LMMIO",
                                                (int)lba_dev->hba.bus_num.start);
@@ -1001,7 +1001,7 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
                                        io->start;
                                r = &lba_dev->hba.lmmio_space;
                                r->name = lba_dev->hba.lmmio_name;
-                       } else if (!lba_dev->hba.elmmio_space.start) {
+                       } else if (!lba_dev->hba.elmmio_space.flags) {
                                sprintf(lba_dev->hba.elmmio_name,
                                                "PCI%02x ELMMIO",
                                                (int)lba_dev->hba.bus_num.start);


>> @@ -1503,6 +1503,7 @@ lba_driver_probe(struct parisc_device *dev)
>>         if (lba_dev->hba.gmmio_space.flags)
>>                 pci_add_resource(&resources, &lba_dev->hba.gmmio_space);
>>
>> +       lba_dev->hba.bus_num.flags = IORESOURCE_BUS;
> 
> But I think this one is actually related to commit 30aa80da43
> ("parisc/PCI: register busn_res for root buses").  I would set the
> bus_num resource type in lba_legacy_resources() to be parallel with
> lba_pat_resources(), as in the attached patch, but this way is OK,
> too.
> 
> Whichever way you go, both fixes look good to me:
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Thanks, I'll take and push your change. 
Still need to test on another machine though.

Maybe you could help me with another problem which I have with my C3000 as well?

That's the current log:
Found devices:
1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Allegro W2 at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
7. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Whole cache flush 492314 cycles, flushing 7983104 bytes 1594427 cycles
Setting cache flush threshold to 180000 (1 CPUs online)
SBA found Astro 2.1 at 0xfffffffffed00000
Elroy version TR4.0 (0x5) found at 0xfffffffffed30000
LBA 10:0: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0x1fff]
pci_bus 0000:00: root bus resource [mem 0xfffffffff2000000-0xfffffffff23fffff] (bus address [0xf2000000-0xf23fffff])
pci_bus 0000:00: root bus resource [bus 00]
pci 0000:00:0c.0: [1011:0019] type 00 class 0x020000
pci 0000:00:0c.0: reg 10: [io  0x1000-0x107f]
pci 0000:00:0c.0: reg 14: [mem 0xfffffffff2008000-0xfffffffff20083ff]
pci 0000:00:0c.0: reg 30: [mem 0xfffffffff2040000-0xfffffffff207ffff pref]
pci 0000:00:0d.0: [11d4:1889] type 00 class 0x040100
pci 0000:00:0d.0: reg 10: [mem 0xfffffffff200c000-0xfffffffff200c1ff pref]
pci 0000:00:0d.0: reg 14: [mem 0xfffffffff200b000-0xfffffffff200b00f pref]
pci 0000:00:0d.0: reg 18: [mem 0xfffffffff200a000-0xfffffffff200a00f pref]
pci 0000:00:0d.0: reg 1c: [mem 0xfffffffff2009000-0xfffffffff200900f pref]
pci 0000:00:0d.0: supports D2
pci 0000:00:0e.0: [100b:0002] type 00 class 0x01018a
PCI: Enabled native mode for NS87415 (pif=0x8f)
pci 0000:00:0e.0: reg 10: [io  0x0f00-0x0f07]
pci 0000:00:0e.0: reg 14: [io  0x0e00-0x0e03]
pci 0000:00:0e.0: reg 18: [io  0x0d00-0x0d07]
pci 0000:00:0e.0: reg 1c: [io  0x0b00-0x0b03]
pci 0000:00:0e.0: reg 20: [io  0x0a00-0x0a0f]
pci 0000:00:0e.1: [100b:000e] type 00 class 0x068000
pci 0000:00:0e.2: [100b:0012] type 00 class 0x0c0310
pci 0000:00:0e.2: reg 10: [mem 0xfffffffff2007000-0xfffffffff2007fff]
pci 0000:00:0e.2: reg 14: [mem 0xfffffffff2006000-0xfffffffff2006fff]
pci 0000:00:0f.0: [1000:000b] type 00 class 0x010000
pci 0000:00:0f.0: reg 10: [io  0x0900-0x09ff]
pci 0000:00:0f.0: reg 14: [mem 0xfffffffff2005000-0xfffffffff20053ff 64bit]
pci 0000:00:0f.0: reg 1c: [mem 0xfffffffff2002000-0xfffffffff2003fff 64bit]
pci 0000:00:0f.0: supports D1 D2
pci 0000:00:0f.1: [1000:000b] type 00 class 0x010000
pci 0000:00:0f.1: reg 10: [io  0x0800-0x08ff]
pci 0000:00:0f.1: reg 14: [mem 0xfffffffff2004000-0xfffffffff20043ff 64bit]
pci 0000:00:0f.1: reg 1c: [mem 0xfffffffff2000000-0xfffffffff2001fff 64bit]
pci 0000:00:0f.1: supports D1 D2
Elroy version TR4.0 (0x5) found at 0xfffffffffed32000
LBA 10:1: PCI host bridge to bus 0000:01
pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
pci_bus 0000:01: root bus resource [mem 0xfffffffff6000000-0xfffffffff6ffffff] (bus address [0xf6000000-0xf6ffffff])
pci_bus 0000:01: root bus resource [mem 0xfffffffff2400000-0xfffffffff27fffff] (bus address [0xf2400000-0xf27fffff])
pci_bus 0000:01: root bus resource [bus 01-02]
pci 0000:01:04.0: [103c:1005] type 00 class 0x038000
pci 0000:01:04.0: reg 10: [mem 0xf6000000-0xf7ffffff]
pci 0000:01:04.0: reg 30: [mem 0xfffffffff2400000-0xfffffffff240ffff pref]
pci 0000:01:05.0: [121a:0002] type 00 class 0x040000
pci 0000:01:05.0: reg 10: [mem 0xf8000000-0xf8ffffff pref]
pci 0000:01:06.0: [3388:0021] type 01 class 0x060400
pci 0000:01:06.0: supports D1 D2
pci 0000:01:06.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:01:04.0: no compatible bridge window for [mem 0xf6000000-0xf7ffffff]

^^ HERE ^^^
That's actually the problem.
pci 0000:01:04.0, pci 0000:01:05.0 and maybe pci 0000:01:06.0 should be:
pci 0000:00:04.0, pci 0000:00:05.0 and maybe pci 0000:00:06.0.

This problem is documented in lba_pci.c as a bug on the C3000 machines, that
everything listed under PCI02 actually lives under PCI00.
Just search for the lengthy comment in lba_pci.c (search for keyword C3000).

Can you maybe give me some hints how I can build a proper workaround for that problem?
Is there any similar workaround in the pci codebase which I haven't found yet?
The reference code in lba_pci.c doesn't compile any longer, but maybe 
it's possible to reactivate it somehow?


iosapic: no IRTE for 0000:01:04.0 (IRQ not connected?)
pci 0000:01:05.0: no compatible bridge window for [mem 0xf8000000-0xf8ffffff pref]
iosapic: no IRTE for 0000:01:05.0 (IRQ not connected?)
pci_bus 0000:02: busn_res: can not insert [bus 02-ff] under [bus 01-02] (conflicts with (null) [bus 01-02])
pci 0000:02:00.0: [102b:0525] type 00 class 0x030000
pci 0000:02:00.0: reg 10: [mem 0xfa000000-0xfbffffff pref]
pci 0000:02:00.0: reg 14: [mem 0xf9800000-0xf9803fff]
pci 0000:02:00.0: reg 18: [mem 0xf9000000-0xf97fffff]
pci 0000:02:00.0: reg 30: [mem 0xf9820000-0xf983ffff pref]
pci 0000:01:06.0: PCI bridge to [bus 02-ff]

^^^^ HERE ^^^^
Should this be something like (in **): ?
   pci 0000:01:06.0: PCI bridge to *BUS 02-ff* [bus 02-ff
But probably it's related to the C3000 bug mentioned above.
   

pci 0000:01:06.0:   bridge window [io  0x0000-0x0fff]
pci 0000:01:06.0:   bridge window [mem 0xf9000000-0xfbffffff]
pci 0000:01:06.0:   bridge window [mem 0xffffffff00000000-0xffffffff000fffff 64bit pref]
pci 0000:01:06.0: address space collision: [io  0x0000-0x0fff] conflicts with PCI01 Ports [io  0x12000-0x13fff]
pci 0000:01:06.0: no compatible bridge window for [mem 0xf9000000-0xfbffffff]
pci 0000:01:06.0: no compatible bridge window for [mem 0xffffffff00000000-0xffffffff000fffff 64bit pref]
pci 0000:01:06.0: no compatible bridge window for [??? 0x00000000 flags 0x0]
pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
pci 0000:01:06.0: device not available (can't reserve [io  0x0000-0x0fff])
pci 0000:01:06.0: Error enabling bridge (-22), continuing
Elroy version TR4.0 (0x5) found at 0xfffffffffed38000
LBA 10:4: PCI host bridge to bus 0000:03
pci_bus 0000:03: root bus resource [io  0x28000-0x29fff] (bus address [0x8000-0x9fff])
pci_bus 0000:03: root bus resource [mem 0xfffffffff3000000-0xfffffffff33fffff] (bus address [0xf3000000-0xf33fffff])
pci_bus 0000:03: root bus resource [bus 03]
pci 0000:03:01.0: [12ae:0001] type 00 class 0x020000
pci 0000:03:01.0: reg 10: [mem 0xfffffffff3000000-0xfffffffff3003fff]
pci 0000:03:03.0: [1011:0019] type 00 class 0x020000
pci 0000:03:03.0: reg 10: [io  0x28000-0x2807f]
pci 0000:03:03.0: reg 14: [mem 0xfffffffff3004000-0xfffffffff300407f]
pci 0000:03:03.0: reg 30: [mem 0xfffffffff3040000-0xfffffffff307ffff pref]
Elroy version TR4.0 (0x5) found at 0xfffffffffed3c000
.....

Thanks!
Helge
