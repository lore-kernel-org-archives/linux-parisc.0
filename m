From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Sat, 19 Feb 2005 15:27:23 -0700
Message-ID: <20050219222723.GA12572@colo.lackof.org>
References: <20050216065539.GB5251@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050216065539.GB5251@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Feb 15, 2005 at 11:55:39PM -0700, Grant Grundler wrote:
> Running 2.6.11-rc4-pa0-plus (equivalent to -pa1) on a500-65 (riot).
> xfs ran spew for 48h but panic'd when I did a "cvs up -A"
> to the CVS source tree on the same file system.

XFS behaves better with sym2+MMIO on j6000 running a 64-bit SMP kernel.
I was able to run spew several hours with no problems.
This is without the patch that Joel pointed out from the -mm tree.

This suggests there is a problem with Astro/Elroy programming
where "Sprockets" firmware (for Astro based workstations) does
something different than PAT PDC firmware on a500.
I'm investigating.


However, did see one "WARN_ON" when I rsync (/home to /home2):
root@gggj6k:/home# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda3              1783984   1522420    170940  90% /
tmpfs                  4110708         0   4110708   0% /dev/shm
/dev/sda4             15439312  13086812   1568220  90% /home
/dev/sdb3             17019904   5155384  11864520  31% /mnt
/dev/sdb4             17773568  12486340   5287228  71% /home2

root@gggj6k:/home# lsscsi
[1:0:5:0]    disk    SEAGATE  ST318203LC       0001  /dev/sda
[1:0:6:0]    disk    FUJITSU  MAJ3364MC        HP12  /dev/sdb

The rsync completed but one error showed up 4 times on the console
during the second half (about) of the rsync:

Filesystem "sdb4": XFS internal error xfs_btree_check_sblock at line 342 of file fs/xfs/xfs_btree.c.  Caller 0x00000000102f1b84
Backtrace:
 [<00000000101145e0>] dump_stack+0x18/0x28
 [<00000000102eceac>] xfs_error_report+0x64/0x70
 [<00000000102d7718>] xfs_btree_check_sblock+0x78/0xf8
 [<00000000102f1b84>] xfs_inobt_lookup+0x144/0x3a0
 [<00000000102f3514>] xfs_inobt_lookup_le+0x24/0x30
 [<00000000102f08f0>] xfs_dialloc+0xe90/0x12e0
 [<00000000102f6638>] xfs_ialloc+0x70/0x4e0
 [<0000000010310a10>] xfs_dir_ialloc+0xb8/0x3e8
 [<0000000010316d30>] xfs_create+0x2f0/0x810
 [<0000000010326140>] linvfs_mknod+0x1e0/0x298
 [<000000001032620c>] linvfs_create+0x14/0x20
 [<00000000101d3c04>] vfs_create+0xbc/0xf8
 [<00000000101d4a30>] open_namei+0xb58/0xc10
 [<00000000101b5b14>] filp_open+0x44/0x98
 [<00000000101b5f98>] sys_open+0x98/0x110
 [<0000000010107fac>] syscall_exit+0x0/0x14


Perhaps this is fixed in the patches; I haven't looked.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
