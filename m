From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] xfs and ext3 pb on 2.6.11-pa
Date: Fri, 11 Mar 2005 18:00:12 +0100
Message-ID: <4208D5150000DBAE@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello pa,

I was interested by xfs pb related by Grant and GMSoft and I reach to als=
o
obtain a corupted xfs (on a disk slice over which a reading dd doesn't se=
ems
to encounter any pb).

On my b180 running a 2.6.11-pa2 (cvs dated 20050310) with xfs builtin, th=
e
error is always the same:
XFS mounting filesystem sdd1
attempt to access beyond end of device
sdd1: rw=3D0, want=3D3130210928, limit=3D4098200
I/O error in filesystem ("sdd1") meta-data dev sdd1 block 0xba933a68    
  ("xfs_trans_read_buf") error 5 buf count 4096

>>here xfs_check ...
>> then remount and make menuconfig

XFS mounting filesystem sdd1
attempt to access beyond end of device
sdd1: rw=3D0, want=3D3130110864, limit=3D4098200
I/O error in filesystem ("sdd1") meta-data dev sdd1 block 0xba91b388    
  ("xfs_trans_read_buf") error 5 buf count 4096

>> here xfs_repair ...
>> then same remount and make menuconfig

XFS mounting filesystem sdd1
attempt to access beyond end of device
sdd1: rw=3D0, want=3D3130110864, limit=3D4098200
I/O error in filesystem ("sdd1") meta-data dev sdd1 block 0xba91b388    
  ("xfs_trans_read_buf") error 5 buf count 4096
...

this pb seems to be reproducible on D270, c3600 and b180 (all 32bit).

Is it the same with a 64bit kernel as for a A model?

mmm I thought first to a xfs pb when I remember that I encountered (but o=
nly
one time on only one 32bit system) a similar message with a ext3 (/var) o=
n
another b180 running another  2.6.11-pa1:
attempt to access beyond end of device
md3: rw=3D0, want=3D336860182, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D168430090
Aborting journal on device md3.
ext3_abort called.
EXT3-fs error (device md3): ext3_journal_start_sb: Detected aborted journ=
al
Remounting filesystem read-only
EXT3-fs error (device md3) in start_transaction: Journal has aborted
EXT3-fs error (device md3) in start_transaction: Journal has aborted
EXT3-fs error (device md3) in start_transaction: Journal has aborted
attempt to access beyond end of device
md3: rw=3D0, want=3D1961286348, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D980643173
attempt to access beyond end of device
md3: rw=3D0, want=3D3906093258, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D1953046628
attempt to access beyond end of device
md3: rw=3D0, want=3D3535458028, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D1767729013
attempt to access beyond end of device
md3: rw=3D0, want=3D3068543198, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D1534271598
attempt to access beyond end of device
...
attempt to access beyond end of device
md3: rw=3D0, want=3D3465680116, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D1732840057
attempt to access beyond end of device
md3: rw=3D0, want=3D3772833498, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D1886416748
attempt to access beyond end of device
md3: rw=3D0, want=3D3428729052, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D1714364525
attempt to access beyond end of device
md3: rw=3D0, want=3D3739535560, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D1869767779
attempt to access beyond end of device
md3: rw=3D0, want=3D1581312222, limit=3D511744
EXT3-fs error (device md3): ext3_free_branches: Read failure, inode=3D122=
11,
block=3D790656110
ext3_reserve_inode_write: aborting transaction: Journal has aborted in __=
ext3_journal_get_write_access<2>EXT3-fs
error (device md3)dext3_reserve_inode_write: aborting transaction: Journa=
l
has aborted in __ext3_journal_get_write_access<2>EXT3-fs error (device md=
3)dEXT3-fs
error (device md3) in ext3_orphan_del: Journal has aborted
EXT3-fs error (device md3) in ext3_truncate: Journal has aborted
__journal_remove_journal_head: freeing b_committed_data

But here it seems that a fsck was enough to help the system to work again=

for 3 day without any new error messages
(let see after the w-e, ...)

Are they well related pb or completely seperated?
If well related, which code trunk is/are common to xfs and ext3?

Any idea?

Thanks in advance,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
