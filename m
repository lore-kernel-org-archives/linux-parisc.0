Return-Path: <vapier@gentoo.org>
Received: from wh0rd.org (wh0rd.org [212.13.198.204])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E6B149B1
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 13 Apr 2004 20:06:47 -0600 (MDT)
From: Mike Frysinger <vapier@gentoo.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo 2
Date: Tue, 13 Apr 2004 22:06:38 -0400
References: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
	<200404130021.13209.vapier@gentoo.org>
	<200404130959.23054.deller@gmx.de>
In-Reply-To: <200404130959.23054.deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200404132206.38525.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tuesday 13 April 2004 03:59 am, Helge Deller wrote:
> My above test was with the sstfb driver built-in into the kernel and with
> all other graphics drivers (incl. stifb and STI text console) disabled.
>
> Then, in a second test I enabled STIFB, and choosed SSTFB as module.

ok, here's what i found ...

the card i originally tried doesnt seem to work atm ... it's the obsidian card 
that was top of the line in its day because it's basically 2 voodoo2's on 1 
pci card ... when i modprobe the module, machine locks up ... when i boot 
with the driver built in, it dies, but i can at least see a bunch of oops 
messages ;)

i had another voodoo2 card, a sti black magic, and it works as you 
advertise :)

thanks
-mike
