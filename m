Received: from web10.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA04158
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Jun 2000 13:02:29 -0600
Date: Wed, 28 Jun 2000 14:36:50 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Alan Modra <alan@linuxcare.com.au>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Recipe
In-Reply-To: <Pine.LNX.4.21.0006270919200.16671-100000@front.linuxcare.com.au>
Message-ID: <Pine.BSO.4.21.0006281242220.12561-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Tue, 27 Jun 2000, Alan Modra wrote:
> Agreed.  The list of modules is a bit out-of-date too.  You should be
> checking out the binutils-2.10 module, not binutils.

Hmmm... now I'll have to go back over to the ALPHA and see if things
suddenly work there....

> #make gcc
> mkdir pagcc
> cd pagcc
> /usr/src/parisc/gcc/configure --target=hppa1.1-linux --prefix=/usr/parisc \
>   --host=i586-linux --disable-nls --with-includes=/usr/parisc/include
> make

This needs to be "make LIBGCC2_INCLUDES=-I/usr/parisc/include" (on my
system at least, which is a Debian slink based Corel Linux 1.1 with slink
updates.)  The --with-includes didn't seem to do much, though
maybe I just didn't notice.  

The --{disable|without}-nls seems not to be necessary on (most?) Linux
systems.

Anyway, I now have my very own lifimage, thanks.  Here's knocking on
wood...

--
Brian
