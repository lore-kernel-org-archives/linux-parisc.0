Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA29603
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Nov 2000 12:12:55 -0700
Message-Id: <200011031919.LAA00315@milano.cup.hp.com>
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot command 
In-reply-to: Your message of "Fri, 03 Nov 2000 11:03:23 PST."
             <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>
Date: Fri, 03 Nov 2000 11:19:29 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Kailashnath V Rampure wrote:
> Yes I have been following the same Doc.
> its tries to boot from the sda  as I can see the hard disk path. I have 2 
> Hdd's one sda and other sdb. the path are 8/16/5.6 and other is 8/16/5.0. 
> Here I think /dev/sda is 8/16/5.6.

The lower numbered SCSI ID will be /dev/sda.
SCSI devices are lettered in the order they are discovered.
The order is reflected in /proc/scsi/scsi.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
