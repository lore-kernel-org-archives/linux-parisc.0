Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03042
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 09:20:19 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id LAA04574
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Jun 1999 11:29:34 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3773A05E.3C75BE51@thepuffingroup.com>
Date: Fri, 25 Jun 1999 11:29:34 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] GREAT NEWS: THE KERNEL REALLY BOOTS THE FIRST TIME !!!!!!!!!!
List-ID: <linux-parisc.vger.kernel.org>

Forwarding this one on as well...

- Alex


-------- Original Message --------
Subject: GREAT NEWS: THE KERNEL REALLY BOOTS THE FIRST TIME !!!!!!!!!!
Date: Fri, 25 Jun 1999 15:49:26 +0200
From: Helge Deller <helge.deller@ruhr-uni-bochum.de>
To: parisc-linux <parisc-linux@thepuffingroup.com>

(PS:maybe this message appears 3 times - sorry, if that should
happen...)

Hi PA-RISC-FANS !

After some (really hard) hours of hacking :

!!!!!!!!!!!!!!!! I GOT THE KERNEL BOOTING !!!!!!!!!!!!!!!!!!!!!!!

Instructions: (as normal!)
make dep clean vmlinux
make Image

You can then find the bootable Image in arch/parisch/hp/boot/Image.

You will see the LED´s blinking !!!!!!!

I´m SO HAPPY !
Let the hacking begin !
I will commit my changes in the next hour !

Many thanks to Jason Eckhard & Alex DeVries for their great first
implemenations of IPL/Makefiles !

Helge Deller,
Germany.
