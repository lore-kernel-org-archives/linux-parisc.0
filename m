Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84CCD482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Apr 2002 19:13:16 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel 
Date: Wed, 1 May 2002 13:15:45 +1200
Message-ID: <014b01c1f0ad$b83712b0$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20020501004239.75E8B482B@dsl2.external.hp.com>
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

 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Cool. I have sort of brute forced the ioctl things from sparc64 in,
and the kernel compiles, and I will reboot shortly to test it.

Thanks, James

> I just wanted to provide confirmation this is only a problem of
> the ioctl wrappers missing which are needed by 64-bit kernels.
> L2000 requires 64-bit kernel.
> 
> I currently have a (hardly used) md0 on my B180:
> debian:~# df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/sde3              1451376    689608    688040  51% /
> /dev/sde4              6784352   3743488   2696240  59% /home
> /dev/md0              65832516     32836  65130848   1% /var/www
> debian:~# cat /etc/raidtab
> raiddev /dev/md0
>         raid-level              0
>         nr-raid-disks           8
>         persistent-superblock   1
>         chunk-size              8
> 
>         device                  /dev/sda
>         raid-disk               0
> 	device                  /dev/sdb
> 	raid-disk               1
> ...
> 
> 
> grant

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.1.1

iQA/AwUBPM9BwFW+bhIOiSqWEQJWhACfSpCPShEd/If0CC9Gzjprt0feQIwAn2NQ
ssVQmGnA3jC3vCvFv0wsaMJ/
=L0iG
-----END PGP SIGNATURE-----
