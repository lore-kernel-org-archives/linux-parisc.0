Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9FA5A4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 11:35:26 -0700 (MST)
Date: Sat, 4 Jan 2003 19:35:15 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Cc: stevec@bullseye.com
Subject: Re: [parisc-linux] B1000 Debian 3.0r1 High-Priority Machine Check
Message-Id: <20030104193515.19808d5a.varenet@esiee.fr>
In-Reply-To: <000001c2b41c$37348cf0$a87ba8c0@steve>
References: <20030104015526.GB29245@dsl2.external.hp.com>
	<000001c2b41c$37348cf0$a87ba8c0@steve>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, 4 Jan 2003 10:07:59 -0800
"Steve Cornett" <stevec@bullseye.com> wrote:

> > Steve, can you try the beta Boot Floppies?
> My B1000 cannot seem to boot from floppy.  I verified my floppy drive
> works from HP-UX.  When I use the firmware command "boot floppy" I
> immediately get the error shown below, without an attempt to read from
> the floppy drive.
Of course, there is no floppy support.

The "Boot Floppies" are the "boot images" if you prefer. They can be used on CD or any other media support.

Perhaps you should take a look at the PA-RISC/Linux Boot HOWTO:
http://pateam.esiee.fr/doc.html

You'll find there useful info on various way to boot Linux on an hppa box (like from network, which is what I would recommend here).

Can you eventually try one of the 2.4.19 ISO or lifimage that you can find there:
http://pateam.esiee.fr/cd-images/testing/
http://pateam.esiee.fr/cd-images/lifimages/

Those are known to work on B1000. If they fail, then we may start looking for a problem related either to 3.0r1 CD or to your box (specific configuration ?)

HTH,

Greetings,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
