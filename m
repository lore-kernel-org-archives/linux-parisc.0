Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.planb.de (aldebaran.planb.de [212.227.14.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B0D2482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jan 2002 09:08:18 -0700 (MST)
Date: Wed, 2 Jan 2002 17:08:15 +0100
To: Matt London <palinux@knm.yi.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 710 support
Message-ID: <20020102170814.A27904@electra.intern.planb.de>
References: <Pine.LNX.4.33.0201021550230.30124-100000@coffeepot.matt>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <Pine.LNX.4.33.0201021550230.30124-100000@coffeepot.matt>
From: Enrik Berkhan <Enrik.Berkhan@planb.de>
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

On Wed, Jan 02, 2002 at 03:54:15PM +0000, Matt London wrote:
>   I've not been following the list for quite some months, and I was
> wondering how support for the 710 was going (i.e. is net+scsi working
> yet?). It'd be nice to get my 710 actually doing something useful :&)

I've got a 710 up & running with the 0.93 iso without major problems.
The 710 doesn't have a CDROM, so I booted the included lifimage via
rbootd from a PC running Debian Potato (rbootd is included as package).

The only minor problem was NFS-mounting the installation CD. The Debian
installer tries a V3 mount without running a portmapper, thus hanging
for lockd/statd until timeout, which is really long. So I did the mount
by hand using the "nolock" option and told the installer to use an 
already mounted partition.

You have to upgrade the kernel after installation to get a usable (dumb)
framebuffer if you want to give XFree a try. There is no HIL mouse
support in the CVS kernel yet.

Enrik
-- 
Enrik Berkhan                                         plan b. GmbH
                                                      Rüppurrer Straße 4
+49-721-388582 (voice)                                76137 Karlsruhe
+49-721-388581 (fax)                                  Germany
