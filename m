Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA03307
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 15:50:15 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 11 Jun 1999 21:49:30 -0000
Subject: Re: [parisc-linux] partitioning on HPUX
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 11 Jun 1999 22:48:40 +0100 (BST)
Cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <3761504A.BF1480CA@thepuffingroup.com> from "Alex deVries" at Jun 11, 99 02:07:06 pm
Content-Type: text
Message-Id: <E10sZAH-0003bn-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Most Linux distributions really expect some sort of partitioning, so
> it's easier to just inherit an existing one. 

We get all the existing ones for free.

> Oh, and at some point we'll do LVM, but that'll mean merging it in with
> the existing Linux LVM tools.

It depends how smart the HP LVM is and if its documented enough. LVM is
just a variant on the raid striping problem so its not a lot of code to
support until you want to do clever stuff like live resizing
