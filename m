Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE4F9482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 06:51:18 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA18569
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Jun 2001 06:43:54 -0600
Received: from pc2-hems4-0-cust95.bre.cable.ntl.com (HELO rhirst.linuxcare.com) (213.107.176.95)
  by mailserv2.iuinc.com with SMTP; 5 Jun 2001 12:51:13 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BEFCDB007; Tue,  5 Jun 2001 13:47:19 +0100 (BST)
Date: Tue, 5 Jun 2001 13:47:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: jheumann@fonts.de
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 0.9ser can't install on D210
Message-ID: <20010605134719.I25745@linuxcare.com>
References: <3B1CB312.1C9DBAB9@fonts.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B1CB312.1C9DBAB9@fonts.de>; from jheumann@fonts.de on Tue, Jun 05, 2001 at 12:23:14PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 12:23:14PM +0200, jheumann@fonts.de wrote:
> please help,
> 
> i can't load linux pa-risc 0.9seriell on my HP9000/D210.
> Why?

You will see from <http://parisc-linux.org/release-0.9/systems.html>
that D series machines have not been tested.  However, your problem
looks more like trouble reading the CD.  Can you mount the CD on some
other system and see the contents, just to check the CD is burned
properly?

Alternatively you could try a network boot, as described in the
README on the CD.

Richard


> 
> (HP-UX 10.20 is running....)
> 
> Jan Heumann
> jheumann@fonts.de
> -----------------------------------------------------
> Main Menu: Enter command > search
> 
> Searching for potential boot device(s)...
> This may take several minutes.
> 
> To discontinue search, press any key (termination may not be immediate).
> 
> 
> 
>    Path Number        Device Path (dec)        Device Type
>    -----------        -----------------        -----------
>    P0                 4.5                      Random access media
>    P1                 4.8                      Random access media
>    P2                 16/5.2                   Random access media
>    P3                 16/6.0                   LAN Module
> 
> 
> Main Menu: Enter command > boot p2
> Interact with IPL (Y or N)?> n
> 
> Booting...
> Boot IO Dependent Code (IODC) revision 1
> 
> IPL error: bad IPL checksum.
> 
> Error Reading IPL
> 
> Main Menu: Enter command > search
