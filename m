Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA19527
	for <parisc-linux@puffin.external.hp.com>; Fri, 23 Jun 2000 09:25:18 -0600
Received: from springhead.px.uk.com (IDENT:dg@springhead.px.uk.com [172.16.18.41])
	by bastion.power-x.co.uk (8.9.3/8.9.3) with ESMTP id QAA15566
	for <parisc-linux@thepuffingroup.com>; Fri, 23 Jun 2000 16:26:05 +0100
Date: Fri, 23 Jun 2000 16:25:19 +0100 (BST)
From: "Dr. David Gilbert" <gilbertd@treblig.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10006231621230.12873-100000@springhead.px.uk.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Getting 712 to boot
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I've just tried PA/Linux for the first time on a mouldy 712/100 lying
in the back of our server room.

  I'm cross building from a Linux/x86 box (RH 6.1) and followed most of
the recipe.

  I'm net booting it and the kernel loads, detects all the devices and
then stops after:

Found i82596 @0xf0107000, IRQ 535
early initialization of device eth0 is deferred
SBA at 0xfed00000

Any ideas?

Dave

/------------------------------------------------------------------\
| Dr. David Alan Gilbert | Work:dg@px.uk.com +44-161-286-2000 Ex258|
| -------- G7FHJ --------|---------------------------------------- |
| Home: dave@treblig.org            http://www.treblig.org         |
\------------------------------------------------------------------/
