Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA31095
	for <parisc-linux@puffin.external.hp.com>; Wed, 14 Jun 2000 12:44:22 -0600
Received: from localhost (catfish@localhost)
	by jesse.crash.lan (8.9.3/8.9.3) with ESMTP id NAA00747
	for <parisc-linux@thepuffingroup.com>; Wed, 14 Jun 2000 13:45:58 -0500
Date: Wed, 14 Jun 2000 13:45:58 -0500 (CDT)
From: "T. Martin" <catfish@alltel.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] oops, egcs didn't build all the way...
In-Reply-To: <20000614105545.K29056@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.10.10006141344360.727-100000@jesse.crash.lan>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


I just did the ./configure and make and it was building it from there. 
This is the egcs cross compiler from the puffin cvs. 
Thanks. 


catfish: icq #20116127


On Wed, 14 Jun 2000 willy@thepuffingroup.com wrote:

> On Wed, Jun 14, 2000 at 12:05:06AM -0500, T. Martin wrote:
> > egcs failed to build, 
> > RH 6.1
> > ar: libE77/Labort.o: No such file or directory
> > make[2]: *** [libg2c.a] Error 1
> > make[2]: Leaving directory `/opt/puffin/egcs/i586-pc-linux-gnu/libf2c'
> 
> um, this is fortran stuff.  why on earth is it trying to build fortran?!
> 
> -- 
> The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
> 
