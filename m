Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BA16482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 May 2001 09:36:08 -0600 (MDT)
Sender: delahaym@esiee.fr
Message-ID: <3AF5710E.722B6AFF@esiee.fr>
Date: Sun, 06 May 2001 17:43:10 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: plaven@ozemail.com.au, puffin@esiee.net,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] getting there!
References: <3AF568A0.28096.143DEB3@localhost>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

I Pete!
I currently try to make a lan boot, and I got the same error.
When I set NFSROOT=x.x.x.x:/path/to/nfs/root
it resolves the problem.

http://lists.parisc-linux.org/pipermail/parisc-linux/2000-November/009962.html

Regards,
Matthieu

Pete wrote:
> 
> Hey everyone,
> 
> Thanks to Grants lifimage I've finally started getting somewhere.
> 
> I'm using a linux box as a NFSboot server.  The kernel is booting,
> but when it gets to the point of reading the root file system, I'm
> getting an error on the nfsservers messages saying: tftp: read:
> connection refused.
> 
> I'm very new to booting like this, and if it wasn't for the lifimage
> Grant put up for ftp I doubt I'd be this far.
> 
> I have setup nfs, I have exported the file system for the base fs
> from external etc... but this error of tftp refusing the connection I
> can't seem to find anything to say what needs to be configured, to
> get it further.
> 
> TIA,
> 
> Pete.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
Matthieu Delahaye
ESIEE Team
http://mkhppa1.esiee.fr/
