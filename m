Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D36634834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jun 2003 02:12:52 -0600 (MDT)
Date: Thu, 12 Jun 2003 10:12:48 +0200
Message-ID: <3ED71F6D0000466D@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] palo II (scsi disk path name)
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>On Wed, Jun 11, 2003 at 07:46:54PM +0200, Joel Soete wrote:
> Anoyed to change my fstab because I add or remove a disk to/from the external
> scsi controler of my b2k (boot disk sda became sdb, sdc, or what else),
> I decide so to test devfs ker
el.
>It seems to works (excepted that I could
> not specify root=/dev/scsi/host1/bus0/target5/lun0/part5)

> (a) devfs is shit.  do not use it.

Ok but is there some other alternative to fix this pb?

I spook with "Kurt Garloff <garloff@suse.de
" about its patch "root=/dev/scsi/sdcXbXtXuXpX
support" into 2.4.20 but advise me better devfs?

An lvm ramdisk to rebuild for each new kernel test?

> (b) even if it's compiled in, the kernel still matches `root=' against
a
> built-in table tha
 has nothing to do with devfs.

Clear arg

> (c) devfs is shit.  do not use it.
Ok but is there some other alternative to fix this pb? ;-)

the early lvm discover of evms was removed in last release :(

Thanks for info and advise,
    Joel

PS:
Please accepte my apologies but it seems that my ISP changes a bit its
webmail tools and seems bugy for reply with copy of original text (break
thread, and mainly removed characters?)



---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
