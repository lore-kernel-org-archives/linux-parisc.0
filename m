Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA06107
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Jun 2000 17:20:54 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 28 Jun 2000 23:22:04 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA01630;
	Thu, 29 Jun 2000 09:21:49 +1000
Date: Thu, 29 Jun 2000 09:21:49 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Brian S. Julin" <bri@mojo.calyx.net>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Recipe
In-Reply-To: <Pine.BSO.4.21.0006281242220.12561-100000@mojo.calyx.net>
Message-ID: <Pine.LNX.4.21.0006290913020.27908-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 28 Jun 2000, Brian S. Julin wrote:

> > /usr/src/parisc/gcc/configure --target=hppa1.1-linux --prefix=/usr/parisc \
> >   --host=i586-linux --disable-nls --with-includes=/usr/parisc/include
> > make
> 
> This needs to be "make LIBGCC2_INCLUDES=-I/usr/parisc/include" (on my
> system at least, which is a Debian slink based Corel Linux 1.1 with slink
> updates.)  The --with-includes didn't seem to do much, though
> maybe I just didn't notice.  

You're right.  I forgot.

> The --{disable|without}-nls seems not to be necessary on (most?) Linux
> systems.

--disable-nls turns off support for error/warning messages in languages
other than English.  If English is not your native language, you will want
--enable-nls.  (And turning the option on for native-English speakers
doesn't hurt.  It just adds a little code bloat)

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
