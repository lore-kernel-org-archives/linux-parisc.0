Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c012.snv.cp.net (h001.c012.snv.cp.net [209.228.35.231])
	by dsl2.external.hp.com (Postfix) with SMTP id AC3AE4845
	for <parisc-linux@parisc-linux.org>; Fri,  3 Oct 2003 09:17:42 -0600 (MDT)
Content-Type: text/plain; charset=iso-8859-1
MIME-Version: 1.0
From: "Diego de Fuentes Ceballos" <diego@defuentes.org>
To: bame@hp.com
Date: Fri, 03 Oct 2003 08:17:41 -0700 (PDT)
Cc: diego@defuentes.org, debian-hppa@lists.debian.org,
	parisc-linux@parisc-linux.org
Message-Id: <20031003081741.9348.h007.c012.wm@mail.icqmail.com.criticalpath.net>
Subject: [parisc-linux] Re: PALO boot loader installation problem
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

You were right, i was missing the F0 partition, i repartitioned my hard drive
and now everything is up and running, thanks for your help.

On Thu, 02 Oct 2003 13:51:03 -0600, bame@hp.com wrote:

> 
> 
> I cc-ed parisc-linux@parisc-linux.org
> 
> > Hey everyone, i am having sobe trouble installing Debian hppa on a HP b1000
> > , i
> > have downloaded and burnen a netinstall ISO with kernelm 2.4.22 and got
> > everything up and running, i booted from CD, i installed everything, partit=
> > ioned
> > the hard drive, got the network configured and the base system installed but
> > when i try to make the system installable i get this error:
> > 
> > 
> > Problem
> > 
> > PALO wasn=B4t able to install. You can still remote boot and point the root=
> >  device
> > to the installed system.
> 
> The most likely cause of this is the palo (aka F0) partition is past
> the 2G mark on the disk or perhaps is too small or maybe there's no
> partition at all.
> 
> > I have no idea how to fix this, "remote boot and point the dive to the inst=
> > alled
> > system?????" WTF???, when i reboot the machi and tri to point the boot load=
> > er to
> > the hard drive i get nowhere, can anyone give me hand?
> 
> Boot from the CD interactively so you can edit the boot command line.
> Get rid of the initrd= argument entirely and change the root=/dev/ram
> to root=/dev/sdaX where X is your root partition, then boot.  This'll
> use the kernel from the CD instead of the one in the palo partition.
> 
> If this works, have a look at your partition table or post it here or
> re-run palo by hand and examine (or post) the error messages.
> 
> 	-P

Diego De Fuentes Ceballos
diego@defuentes.org


-------------------------------------------------------------
Sign up for ICQmail at http://www.icq.com/icqmail/signup.html
