Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA31347
	for <parisc-linux@puffin.external.hp.com>; Wed, 14 Jun 2000 12:47:52 -0600
Message-Id: <200006141848.OAA26497@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] oops, egcs didn't build all the way...
To: catfish@alltel.net (T. Martin)
Date: Wed, 14 Jun 2000 14:48:38 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.10006141344360.727-100000@jesse.crash.lan> from "T. Martin" at Jun 14, 2000 01:45:58 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Wed, 14 Jun 2000 willy@thepuffingroup.com wrote:
> 
> > On Wed, Jun 14, 2000 at 12:05:06AM -0500, T. Martin wrote:
> > > egcs failed to build, 
> > > RH 6.1
> > > ar: libE77/Labort.o: No such file or directory
> > > make[2]: *** [libg2c.a] Error 1
> > > make[2]: Leaving directory `/opt/puffin/egcs/i586-pc-linux-gnu/libf2c'
> > 
> > um, this is fortran stuff.  why on earth is it trying to build fortran?!

Do "make LANGUAGES=c" to only build C.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
