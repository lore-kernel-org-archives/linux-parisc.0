Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88C7B4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 09:02:52 -0700 (MST)
Received: from Tatooine (varenet@Tatooine.r3z0 [192.168.69.3])
	by mail.zigoo.net (8.12.5/8.12.1) with SMTP id h0CG2miL025366
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 17:02:49 +0100
Date: Sun, 12 Jan 2003 17:02:45 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-Id: <20030112170245.497cc85f.varenet@esiee.fr>
In-Reply-To: <3E2188D1.6080807@freebel.net>
References: <20030110170813.X26554@parcelfarce.linux.theplanet.co.uk>
	<3E1AA8D500000AF7@ocpmta8.freegates.net>
	<20030110231313.1215dc79.varenet@esiee.fr>
	<20030110232510.25aef7c2.varenet@esiee.fr>
	<3E2188D1.6080807@freebel.net>
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

On Sun, 12 Jan 2003 15:25:05 +0000
"Joel Soete" <joel.soete@freebel.net> wrote:

> Hi Thibaut
> 
> Thibaut VARENE wrote:
> > On Fri, 10 Jan 2003 23:13:13 +0100
> > "Thibaut VARENE" <varenet@esiee.fr> wrote:
> > 
> > I hate to reply to myself but I said crap in my previous mail.
> > All apologies:
> > 
> >>FWIW, the default option (used by most people) is data=journal, and is not affected by that bug. We've been using 2.4.20 with ext3 for weeks pretty safely here.
> > 
> > it was: "the default option is data=ordered" of course, which is safe.
> > 
> I just to ask you additional help: I do not recover the method to get 
> the actual setup of my fs ext3 (i do severall test but a time ago and do
> not remember in which state I let it: well operational but what more??)
To get the actual configuration of a ext[23] fs, you can use 'tune2fs -l <device>'. To get the current state of data mode of an ext3 fs, look at dmesg. I don't know another way to get that info.
The data mode is decided at mount time, with 'mount -o data=xxx <device>'.

FWIW, I remember having found all that info in man tune2fs, man mount and man mke2fs.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
