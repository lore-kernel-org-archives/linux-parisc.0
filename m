Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC1434829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 16:17:26 -0600 (MDT)
Message-ID: <3D5833EF.7E12EACE@gmx.at>
Date: Tue, 13 Aug 2002 00:17:19 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Eric Boniface <eric_boniface@non.hp.com>
Cc: Parisc mailing list parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Installation issue on 800/F10.
References: <3D57E71C.3080402@non.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Hello !

You are in similar position than I, the machines are not
supported for now. 

BUT, perhaps I can help you to go some further steps.
The machines have a proprietary bus system and also
proprietary interface chips.

To get my E55 running, I wrote a device driver using
the ROM console (used for the boot monitor) as system
console under Linux. 

Rebuild the linux kernel with CONFIG_PDC_CONSOLE enabled
and follow the help steps for setting up the machine:

1. create "/dev/ttyB0" as character device, major=60,
	minor=0 with
	
	mknod /dev/ttyB0 c 60 0

2. edit /etc/inittab to use ttyB0 instead of ttyS0 
	or tty1, ... to be able to login

3. add or change to kernel parameter line to use

	console=ttyB0

This should work, or let's say, should give process
in booting.

One further point: Be patient on this point of kernel
output. On some machines or dependent of the kernel 
version (or whatever), sometimes you have to wait up
to half a minute here ...

With friendly regards
Christoph


Eric Boniface wrote:
> 
> Hi all,
> well I try to install the latest Debian on my (very ? ) old HP9000
> 800/F10, but I have the following message :
> 
> "Branching to kernel entry point 0x00100000.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org"
> 
> I am ok to switch whatever it wants, but I don't really see what I can
> switch.
> For your information, I use a Wyse screen (a vt220 I think) plugged to
> the console port on a SCSI/Console/LAN card.
> 
> Any idea ?
> 
> Thanks in advance !
> Rgds,
> Eric.
> 
> --
> Eric Boniface - Hewlett Packard / HPS-IT Infrastructure Team Grenoble
> Tel.(+33) 4 76 14 30 17 / Telnet : 779-3017
> E-mail : eric_boniface@non.hp.com
> --- Want to know more about Linux on HP PARISC ? Take a look at http://www.parisc-linux.org
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
