Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BCEA4A24
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 10:38:47 -0600 (MDT)
Date: Sat, 29 Sep 2001 12:38:32 -0400 (EDT)
From: <nick@snowman.net>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Betr.: [parisc-linux] HP C180
In-Reply-To: <20010929183349.B25897@dogbert.localdomain>
Message-ID: <Pine.LNX.4.21.0109291237460.11237-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I have been rolling my own kernels, however I've been useing nfsroot with
one of the prebuilt tarballs.  Where can I find the latest debian hppa
bootdisks?  ftp.debian.org?  (I havn't noticed them in my debian mirror).
	Nick

On Sat, 29 Sep 2001, Albert Strasheim wrote:

> Hello,
> 
> Make your own:
> 
>  palo -f /dev/null -k vmlinux -r root.bin -s lifimage [-b iplboot] \
>         -c "0/linux HOME=/ root=/dev/ram initrd=0/ramdisk"
> 
> where vmlinux is the a kernel you've compiled from CVS (possibly using
> the cross-compiler) and root.bin is the latest Debian hppa bootdisk.
> Netboot the resulting lifimage and off you go! :-)
> 
> Regards,
> 
> Albert
> 
> On Sat, 29 Sep 2001, nick@snowman.net wrote:
> 
> > Ok, can you point me to a totally current root image?
> > 	Nick
> > 
> > On Sat, 29 Sep 2001, Richard Hirst wrote:
> > 
> > > On Wed, Sep 26, 2001 at 08:56:08AM +0200, Jurriaan Kalkman wrote:
> > > > >My c180 is now happily booting (current CVS kernel), however whenever I
> > > > >try to ls some dirs (no all, this example is from /usr/bin) I get errors
> > > > >along these lines
> > > > >ls: memory exhausted
> > > 
> > > I had this with 2.4.9, turned out I'd booted a root fs with old libc6
> > > installed.  When I rebooted using a current libc6 the problem went away.
> > > 
> > > Richard
> > > 
> > 
> > 
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
