Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id A204E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Aug 2001 16:12:29 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 700B5B00C; Mon,  6 Aug 2001 23:13:39 +0100 (BST)
Date: Mon, 6 Aug 2001 23:13:39 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180: no real progress :-(
Message-ID: <20010806231339.Z1011@linuxcare.com>
References: <01080622381300.01641@octopus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01080622381300.01641@octopus>; from Reinhard.Gimbel@freenet.de on Mon, Aug 06, 2001 at 10:38:13PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Aug 06, 2001 at 10:38:13PM +0200, Reinhard Gimbel wrote:
> The C180 boots palinux-0.9.2 from CD (additional drive at 
> SESCSI). The system crashes either during kernel/driver 
> installation (1st stage) or during "software" installation (2nd 
> stage).

I have heard of a C160 with what could be similar problems.  The C160
has internal diff scsi drives, and it seems that using that interface
causes disk corruption.  The only way he managed an install was to
disconnect all devices from the diff scsi interface, and install to
disks on the external scsi.  Is that something you can try easily?
Note, he had to physically disconnect the diff disks, it wasn't sufficient
to simply not use them.

What scsi interfaces does that box have anyway?  Boot up msgs should
mention chip numbers - 53c710, 53c720, etc.

> [1] Try to fix the keyboard port problem ! I don't know how 
> many reboots I had top handle this weekend but un-/replugging 
> the keyboard is very boring ... :-)

That problem is being actively worked on.

> [2] Try to get full support of any key (at least german 
> keyboard support lacks on essential things ...) eg. no 
> pipe/vertical bar; no support of capslock (keyboard unusable 
> after accidently hit capslock; nothing helped; un-/replug, too)

Hmm, yeah; I had a UK keyboard where pipe key didn't work.  I got it
with <alt>+124 on the numeric pad, or with <alt-gr> and the key to
the left of '1' (back-quote, etc).  Obviously needs fixing though.

> [3] Sometimes I could see a message like
> "ioctl: LOOP_CLR_FD: No such device or address"
> short time before the C180 crashed. Any idea ?

That's a feature of the installer ;)  Happens on all archs and is harmless.

> Some hints to the system guys:
> 
> [1] Do real disabling of "dhcp-client" if it is set to "no" 
> during installation. (Those kernel message caused by 
> dhcp-client are boring; try it with open editor; great ;-)

That is a problem with the dhcp-client package, again common to all
archs.  The solution is "rm /etc/rc?.d/*dhcp-client".  It has been
discussed on the debian-boot list, and hopefully someone will fix it.
It has been suggested that we switch back to using pump.  There is a
new version of dhcp-client in experimental, but it is much bigger, which
causes problems for people that boot from floppies, at least.

> [2] Try to include a date check/set into the installation 
> routine; user should be informed about hardware clock setting)

I agree, telling what the time is in GMT and in your timezone without
giving you a chance to do anything about it is a little pointless.  You
can use the firmware to set it correctly before you start, but if you are
like me you always forget until it is too late.

Richard
