Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CD02482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 16:04:26 -0600 (MDT)
Date: Fri, 21 Sep 2001 18:05:29 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nfsroot login problems on 720/50
Message-ID: <20010921180529.C32145@megatonmonkey.net>
References: <20010921193553.A11874@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010921193553.A11874@dogbert.localdomain>; from fullung@ilink.nis.za on Fri, Sep 21, 2001 at 07:35:53PM +0200
List-ID: <linux-parisc.vger.kernel.org>

> Good day,
> 
> This message was also sent to debian-hppa. I was wondering anyone on
> this list had any ideas?
> 
> Regards,
> 
> Albert
> 
> 
> I've managed to boot my 720/50 using Linux 2.4.9-pa20 (not -pa22 as I
> stated in my original post)  over the LAN (with a make palo lifimage),
> using a combination of rbootd (for the lifimage), bootpd (for the IP
> address and such), and the userspace nfs daemon for the
> baseplus-20010404.tar.gz NFS root.
>

The rbootd is good.
The lifimage is good.
The bootp server is good.

The baseplus root tarball is bad.

Coming from a similar situation, I had to manually change the
permissions on the baseplus tarball to get it to work. 
Though I clearly can't remember what else I had to do... it was
quite some time ago. I'm now using apt-get and the latest ISO to
install machines.

Questions:

- Are you using devfs?
- Tried just letting the login prompt sit for a while after attempting
  to login? (Usually the error might come after a _long_ time).

On another note, you should try the cdrom installer, since it's
much better and people have put a lot of work into it.

Cheers,
Carlos. 
