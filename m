From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] SLAB bug SMP 64bit / XFS mess
Date: Sun, 10 Apr 2005 22:57:47 -0600
Message-ID: <20050411045747.GA30629@colo.lackof.org>
References: <20050404110025.GA6987@tausq.org>
	<4208AA1B000184AE@mail-3-bnl.tiscali.it>
	<20050408205428.GJ1833@baldric.uwo.ca>
	<20050409021049.0d0a851d@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050409021049.0d0a851d@Tatooine.r3z0>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Apr 09, 2005 at 02:10:49AM +0200, Thibaut VARENE wrote:
> Just for the records:
>
> while trying to debug the XFS issue on my J6k, here what i noticed:
>
> 32bit kernel: no bug

Sorry, though my j6k did not panic with 32-bit kernel, there is
definitely some XFS bug(s?).  Test output and details follow.

grundler <511>uname -a
Linux gggj6k 2.6.12-rc2-pa1 #5 SMP Sun Apr 10 14:13:59 PDT 2005 parisc GNU/Linux

That's despite sym2 using I/O Port space:
	CONFIG_SCSI_SYM53C8XX_IOMAPPED=y

I got alot (> 500 linus scrollback) of the following on console:

0x0: ed 41 00 00 00 10 00 00 a0 c4 59 42 4c ab 26 42
Filesystem "sdb3": XFS internal error xfs_da_do_buf(2) at line 2271 of file fs/4
Backtrace:
 [<1027d514>] xfs_da_do_buf+0x354/0x754
 [<1027d974>] xfs_da_read_buf+0x2c/0x38
 [<1028157c>] xfs_dir2_block_lookup_int+0x74/0x1fc
 [<1028146c>] xfs_dir2_block_lookup+0x1c/0xb8
 [<1027fd30>] xfs_dir2_lookup+0xc8/0x140
 [<102ad50c>] xfs_dir_lookup_int+0x50/0x118
 [<102b26a8>] xfs_lookup+0x68/0xac
 [<102c0894>] linvfs_lookup+0x60/0xa4
 [<1019e8d8>] __lookup_hash+0xc0/0xf8
 [<1019fa58>] lookup_create+0x68/0xcc
 [<1019ff1c>] sys_mkdir+0x78/0x134
 [<1010e178>] syscall_exit+0x0/0x14

And then the last console output was:
0x0: 58 44 32 44 0e 58 01 a8 07 c8 00 20 09 50 00 20
Filesystem "sdb3": XFS internal error xfs_dir2_block_addname at line 128 of fil4
Backtrace:
 [<10281124>] xfs_dir2_block_addname+0x6c0/0x6d4
 [<1027fc14>] xfs_dir2_createname+0x124/0x178
 [<102b3ee8>] xfs_mkdir+0x484/0x6e4
 [<102c07b8>] linvfs_mknod+0x1d0/0x210
 [<1019fe78>] vfs_mkdir+0x94/0xc0
 [<1019ff68>] sys_mkdir+0xc4/0x134
 [<1010e178>] syscall_exit+0x0/0x14

xfs_force_shutdown(sdb3,0x8) called from line 1091 of file fs/xfs/xfs_trans.c. c
Filesystem "sdb3": Corruption of in-memory data detected.  Shutting down filesy3
Please umount the filesystem, and rectify the problem(s)
SMP CALL FUNCTION TIMED OUT! (cpu=1), try 1


My test was "time rsync -aWx --stats / /mnt" with two disks:

grundler@gggj6k:~$ lsscsi
[1:0:5:0]    disk    HP       18.2GB C 80-D94N D94N  /dev/sda
[1:0:6:0]    disk    SEAGATE  ST318203LC       0001  /dev/sdb
grundler@gggj6k:~$ df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda3             16911576  13625088   2427416  85% /
tmpfs                  1812796         0   1812796   0% /dev/shm
/dev/sda1                85528     28487     52625  36% /boot
/dev/sdb3             17171264  13671156   3500108  80% /mnt

Ext3 on sda3 and freshly made "mkfs.xfs -f /dev/sdb3":
	/dev/sda3 on / type ext3 (rw,errors=remount-ro)


The rsync complained *alot* (> 500 lines of scrollback) about:
rsync: stat "/mnt/home/tftpboot/pa8800/var/spool/postfix/deferred/8" failed: Input/output error (5)

rsync stats output:

Number of files: 394227
Number of files transferred: 349625
Total file size: 12845404686 bytes
Total transferred file size: 12845269080 bytes
Literal data: 12845327899 bytes
Matched data: 0 bytes
File list size: 7360585
Total bytes sent: 12869390640
Total bytes received: 6992520

sent 12869390640 bytes  received 6992520 bytes  5379729.75 bytes/sec
total size is 12845404686  speedup is 1.00
rsync error: some files could not be transferred (code 23) at main.c(702)

real    39m52.694s
user    5m52.069s
sys     7m34.079s


hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
