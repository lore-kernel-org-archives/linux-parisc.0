Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA23501
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 07:55:47 -0700
Date: Wed, 17 Jan 2001 08:59:23 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Josiah Carlson <jcarlson@macalester.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] I'm having a couple problems
In-Reply-To: <3A64D1BC3C8.29B5JCARLSON@smtp.macalester.edu>
Message-ID: <Pine.LNX.4.21.0101170856270.2959-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


Josiah,

On Tue, 16 Jan 2001, Josiah Carlson wrote:

> How do I get _actual_ r/w access to the volume that the system boots
> >from?

I had a little trouble here too.  I'm currently working around it by
appending 'rw' to the kernel command line in palo.  This option tells the
kernel to mount the root filesystem as read-write.  It's not the best
solution, but it works for now.
 
- Greg
