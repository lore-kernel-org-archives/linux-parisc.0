Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "James Braid" <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel 
In-Reply-To: Message from "James Braid" <james.braid@peace.com>
   of "Tue, 30 Apr 2002 17:58:59 +1200." <002a01c1f00c$1f288eb0$5e01000a@bongo>
References: <002a01c1f00c$1f288eb0$5e01000a@bongo> 
Date: Tue, 30 Apr 2002 18:42:39 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020501004239.75E8B482B@dsl2.external.hp.com>
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

"James Braid" wrote:
> When I attempt to make a software RAID0 array on 3 1Gb partitions on
> 3 18.2gb internal SCSI disks, I get this error:

I just wanted to provide confirmation this is only a problem of
the ioctl wrappers missing which are needed by 64-bit kernels.
L2000 requires 64-bit kernel.

I currently have a (hardly used) md0 on my B180:
debian:~# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sde3              1451376    689608    688040  51% /
/dev/sde4              6784352   3743488   2696240  59% /home
/dev/md0              65832516     32836  65130848   1% /var/www
debian:~# cat /etc/raidtab
raiddev /dev/md0
        raid-level              0
        nr-raid-disks           8
        persistent-superblock   1
        chunk-size              8

        device                  /dev/sda
        raid-disk               0
	device                  /dev/sdb
	raid-disk               1
...


grant
