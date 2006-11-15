From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Wed, 15 Nov 2006 12:25:06 +0100
Message-ID: <20061115122506.523bdd01.gmsoft@tuxicoman.be>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061115080022.GB30664@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Grant,

It looks like pci_find_bus() return non null for the pcmcia bridge.

        if (pci_find_bus(pci_domain_nr(b), bus)) {
                /* If we already got to this bus through a different bridge, ignore it */
                pr_debug("PCI: Bus %04x:%02x already known\n", pci_domain_nr(b), bus);
                goto err_out;
        }


With PCI_DEBUG and some more printk() I can see this in my dmesg :

PCI: Found 0000:01:06.0 [1180/0475] 000607 02
PCI: Calling quirk 102564c8 for 0000:01:06.0
PCI: Fixups for bus 0000:01
PCI: Scanning behind PCI bridge 0000:01:06.0, config 000000, pass 0
PCI: Scanning behind PCI bridge 0000:01:06.0, config 000000, pass 1
PCI: Bus scan for 0000:01 returning with max=05
PCI: Enabling bus mastering for device 0000:01:06.0
PCI: Bus 0000:02 already known
PCI: Reached err_out:

01:06.0 CardBus bridge: Ricoh Co Ltd RL5c475 (rev 80)
        Subsystem: CARRY Computer ENG. CO Ltd Unknown device 0101
        Flags: bus master, medium devsel, latency 128
        Bus: primary=01, secondary=02, subordinate=05, sec-latency=176
        I/O window 0: 00000000-00000003 [disabled]
        I/O window 1: 00000000-00000003 [disabled]
        16-bit legacy interface ports at 0001

01:06.0 0607: 1180:0475 (rev 80)
        Subsystem: 14ef:0101
        Flags: bus master, medium devsel, latency 128
        Bus: primary=01, secondary=02, subordinate=05, sec-latency=176
        I/O window 0: 00000000-00000003 [disabled]
        I/O window 1: 00000000-00000003 [disabled]
        16-bit legacy interface ports at 0001

This is 2.6.18.2-pa0 on C3600.

Let me know if you need anything else.

Cheers,
  Guy



On Wed, 15 Nov 2006 01:00:22 -0700
Grant Grundler <grundler@parisc-linux.org> wrote:

> On Wed, Nov 08, 2006 at 03:07:06PM +0100, Guy Martin wrote:
> > Hi All,
> > 
> > Referencing this thread about a crash when there is a pcmcia bridge plugged in a C3600 :
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/030312.html
> ...
> > it would be better to fix pci_scan_bus_parented() which returns NULL
> 
> Guy,
> 
> pci_scan_bus_parented() calls pci_create_bus() in order to allocate
> the bus.   pci_create_bus() is obviously failing.
> 
> Can you add printks to each of the follow labels in pci_create_bus()
> and printks for the first two "return NULL" statements?
> 
> It's ok if your tree also has the patch you proposed so it doesn't crash.
> 
> Code from drivers/pci/probe.c:pci_create_bus()
> ...
> sys_create_link_err:
>         class_device_remove_file(&b->class_dev, &class_device_attr_cpuaffinity);
> class_dev_create_file_err:
>         class_device_unregister(&b->class_dev);
> class_dev_reg_err:
>         device_unregister(dev);
> dev_reg_err:
>         down_write(&pci_bus_sem);
>         list_del(&b->node);
>         up_write(&pci_bus_sem);
> err_out:
>         kfree(dev);
>         kfree(b);
>         return NULL;
> }
> 
> Once I know which error is occurring, then I can take
> the next step towards investigating the problem.
> 
> thanks,
> grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
