Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA16105
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Oct 1999 05:24:05 -0600
Message-ID: <19991011112714.29613.rocketmail@web502.yahoomail.com>
Date: Mon, 11 Oct 1999 04:27:14 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] unresolved symbol pci_proc_init
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

compiling the current CVS kernel for a non-PCI machine
like my 715/33 leads to an unresolved symbol message
for pci_proc_init.

In init/main.c is the following code:

#ifdef CONFIG_GECKO
        gsc_init();
        /*
        ** pci_init() is NOT multi-PCI bus friendly.
        */
#ifdef CONFIG_PROC_FS
        pci_proc_init();
#endif
#else
#ifdef CONFIG_PCI
        pci_init();
#endif
#endif

So pci_proc_init is included even if CONFIG_PCI is not
set.

Ulrich
__________________________________________________
Do You Yahoo!?
Bid and sell for free at http://auctions.yahoo.com
