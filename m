Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 70E194A19
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Feb 2001 07:46:38 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730
Date: Fri, 9 Feb 2001 15:48:31 +0100
References: <Pine.LNX.4.21.0102091426380.9525-100000@sgate.charlysworld.de>
In-Reply-To: <Pine.LNX.4.21.0102091426380.9525-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Message-Id: <01020915420103.32355@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Friday 09 February 2001 14:45, M. Grabert wrote:
>
> sorry about the confusing error report.
> I'm actually using serial console, with the configuration above;
> but the initial kernel messages are not redirected to the serial console.
> not until the serial ports are found & initialized ...
> ... but since these kernel messages are printed before the time the
> serial ports are recognized, I can't see them on the terminal, but on the
> monitor.
> My question was, whether there is a kernel parameter (i can pass to palo),
> which redirects ALL kernel messages from the beginning to the serial port
> (before they are regognized by the linux kernel).

on the IPL screen type 

PATH CONSOLE RS232_1
*or*
PATH CONSOLE SERIAL_1

At the next boot PDC will redirect all PDC-messages to the first serial port 
and you will able to boot your PARISC through minicom.

Helge


BTW: Max, your domain doesn't seem to resolve 
	("M. Grabert" <xam@deathsdoor.com>)!
bash-2.04$ nslookup deathsdoor.com
Server:  devserv.devel.redhat.com
*** devserv.devel.redhat.com can't find deathsdoor.com: Non-existent 
host/domain
