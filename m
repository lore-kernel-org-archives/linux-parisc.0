Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA26860
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Jan 2000 00:33:37 -0700
Message-Id: <200001190634.WAA19934@milano.cup.hp.com>
To: Matthew Wilcox <willy@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] NCR driver 
In-reply-to: Your message of "Wed, 19 Jan 2000 00:56:41 PST."
             <20000119005641.D11300@thepuffingroup.com>
Date: Tue, 18 Jan 2000 22:34:39 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> Several people have emailed me and asked if there are any small jobs they
> can do to get themselves started.  Here's one that needs doing.  There
> is an NCR 53c710 driver in linux/drivers/scsi/ncr53c7xx.c.  This is the
> SCSI controller found in the:
> 
> 	712, 715/{64,80,100}, 725/100, A180
> 
> and possibly others.
...

Hi all,
The LASI SCSI code didn't make it's way into the linux-2.3 tree.
Code in linux/drivers/scsi/lasi* can be migrated now.

Someone else could start trying to make PCI NCR SCSI also work under Dino.
Dino code does detect PCI devices and tulip (100BT) driver has started
talking to it's device. Need to enable CONFIG_GSC_DINO from the default
".config". This requires an A, B, or C-class machine to test though.

cheers,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
