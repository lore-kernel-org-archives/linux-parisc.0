Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF6B64829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 13:59:46 -0700 (MST)
Date: Tue, 12 Nov 2002 13:59:42 -0700
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] My System ate a SPARC! *haha* 8-(
Message-ID: <20021112205942.GA7777@beavis.ybsoft.com>
References: <Pine.BSF.4.44.0211122031220.32930-100000@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.44.0211122031220.32930-100000@e0-0.zab2.int.zabbadoz.net>
From: rbrad@uswest.net (Ryan Bradetich)
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

Bjeorn,

What type of system is this.  I am currently tracking down this problem
on the K460.  I know where the problem is caused, just not why yet.

Thanks,

- Ryan
On Tue, Nov 12, 2002 at 08:42:28PM +0000, Bjoern A. Zeeb wrote:
> Hi,
> 
> felt really lucky to have reached INIT for less than a second ;-)
> 
> hit it. looped for(;;);
> 
> had to remove power  cause neither sysreq nor the power button could
> reboot the machine...
> 
> rcS should be the same as everywhere from the .dep .
> 
> 
> 
> Linux version 2.5.47-pa1 (bz@apollo) (gcc version 3.2) #5 Tue Nov 12 19:14:45 UTC 2002
> ...
> Kernel command line: root=/dev/sda3 HOME=/ TERM=linux console=ttyS0 palo_kernel=3/boot/vmlinux-2.5.47-pa1
> ...
> Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 8192 bind 16384)
> Linux IP multicast router 0.06 plus PIM-SM
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> VFS: Mounted root (ext2 filesystem) readonly.
> Freeing unused kernel memory: 372k freed
> INIT: version 2.84 booting
>       _______________________________
>      < Your System ate a SPARC! Gah! >
>       -------------------------------
>              \   ^__^
>               \  (xx)\_______
>                  (__)\       )\/\
>                   U  ||----w |
>                      ||     ||
> rcS(11): Breakpoint
>       _______________________________
>      < Your System ate a SPARC! Gah! >
>       -------------------------------
>              \   ^__^
>               \  (xx)\_______
>                  (__)\       )\/\
>                   U  ||----w |
>                      ||     ||
> rcS(11): Breakpoint
> 
> 
> -- 
> Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
> 56 69 73 69 74				http://www.zabbadoz.net/
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
