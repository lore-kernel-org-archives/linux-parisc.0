Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA07541
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 20:44:40 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 27 Jan 2001 03:48:33 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14MLjZ-0002CG-00; Sat, 27 Jan 2001 03:09:01 +0000
Date: Sat, 27 Jan 2001 03:09:01 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CONFIG_SMP update
Message-ID: <20010127030901.B28987@parcelfarce.linux.theplanet.co.uk>
References: <200101270047.QAA24364@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101270047.QAA24364@milano.cup.hp.com>; from grundler@cup.hp.com on Fri, Jan 26, 2001 at 04:47:53PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jan 26, 2001 at 04:47:53PM -0800, Grant Grundler wrote:
> o problem is pbus_set_ranges() isn't defined.
> Looks like we picked up the new drivers/pci stuff anyway. *sigh*.
> I'll look at this first thing next week.

damn.  i deliberately excluded all the changes to drivers/pci (except
those required to build successfully).  But I forgot to exclude the changes
to include/linux/pci.h.  Looking over it, the only problem is with:

-void pdev_assign_unassigned_resources(struct pci_dev *dev);
-void pci_set_bus_ranges(void);
+void pdev_enable_device(struct pci_dev *);
+void pdev_sort_resources(struct pci_dev *, struct resource_list *, u32);
+unsigned long pci_bridge_check_io(struct pci_dev *);

err... except that you said `pbus_set_ranges()'.  I can still see it:
setup-bus.c:pbus_set_ranges(struct pci_bus *bus, struct pbus_set_ranges_data *outer)

so I'm not sure exactly what problem you're experiencing.

> parisc* Makefiles weren't using proper rules to generate .o from .S files.
> This is a first hack. Willy will follow up with "clean" versions.

Yup, just cleaning up now.

> (it's not pdc calls or console output - unless our spinlocks are
> broken).

well, that could be.  anyone fresh want to look at the spinlock code.
did i get the sense of the test wrong?

-- 
Revolutions do not require corporate support.
