Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA01258
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 15:28:12 -0700
Message-Id: <200012052231.OAA05117@milano.cup.hp.com>
To: Daniel Engstrom <danne@telia.com>
Cc: parisc-linux@thepuffingroup.com, 5116@telia.com
Subject: Re: [parisc-linux] Recent CVS kernel: boot failure on 715/50 & inb() undefined 
In-reply-to: Your message of "Tue, 05 Dec 2000 23:18:24 PST."
             <Pine.LNX.4.21.0012052307320.8673-100000@zaphod.halden.lillfab.se>
Date: Tue, 05 Dec 2000 14:31:18 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Daniel Engstrom wrote:

> Or maybe inb() and outb() should always be defined?

inb/outb need to be defined for the type of I/O bus being supported.

PArisc doesn't have inb/outb instructions like x86.
PCI bus support is platform specific - ie different depending on HBA.
GSC bus support requires faking "I/O port space".
EISA is similar to PCI in this regard.

But HP does have systems with GSC, EISA, and PCI in the same machine.
Right now, only PCI defines a dynamic interface to support all three
at the same time. This "design" definitely needs more work for GSC/EISA
bus support if you (or anyone else) is interested.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
