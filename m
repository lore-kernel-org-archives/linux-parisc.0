From: "Joel Soete" <soete.joel@tiscali.be>
Subject: xfs only investigation [WAS: [parisc-linux] xfs and ext3 pb on
	2.6.11-pa]
Date: Mon, 14 Mar 2005 18:22:04 +0100
Message-ID: <42075CE80000F34F@mail-6-bnl.tiscali.it>
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

Hello all,

I continue investigation on xfs only because seems to be more easy to rep=
roduce:
on the b180 runing a recent kernel 2.6.11-pa2 (cvs co 20050311) just moun=
t
the fs and launch the compile of a kernel (e.g. a merged bk6 :-) ) and it=

stops quickly with error below mentioned 'attempt to access beyond end of=

device...'. Neither xfs_check nor xfs_repair help.

The same pb seems to occure on a d270 and c3600 runing also a recent 2.6.=
11
32bit.

Oth on a A500 (ggg), it seems to works fine since some days :-)

Fortunately, on my b2k I have an additional s.e. hba (hp supplied) on whi=
ch
I can connect the external disk used on the b180 to test xfs: so differen=
t
hba and different iommu?

I boot first a 32bit kernel with builtin xfs support and I reach to recom=
pile
a full kernel the the /mnt/XfsTest fs ...
nevertheless i reach to reproduce (difficultly i agree) when I do in the
same time an untar of the vanilla linux-2.6.11.tar (but just one occurenc=
e;
if remove the created dir linux-2.6.11 and relaunch the untar alone, the
pb doesn't occure ?$)

Has it seems to work better on a500, I would also test this same disk on
same
b2k with the same kernel but 64bit.
I re-launch the test of a kernel compile and untar the same time and _PAN=
IC_
:__(
Backtrace:
 [<000000001027b8e0>] xfs_ialloc_ag_select+0x200/0x340
 [<000000001027c35c>] xfs_dialloc+0x93c/0x958
 [<0000000010282ce8>] xfs_ialloc+0x78/0x500
 [<000000001029bc60>] xfs_dir_ialloc+0xb8/0x348
 [<00000000102a35ac>] xfs_mkdir+0x2c4/0x810
 [<00000000102b00c4>] linvfs_mknod+0x21c/0x258
 [<00000000102b0144>] linvfs_mkdir+0x1c/0x28
 [<00000000101a9ec0>] vfs_mkdir+0xb0/0xe8
 [<00000000101a9fe8>] sys_mkdir+0xf0/0x178
 [<0000000010107f78>] syscall_exit+0x0/0x14


Kernel Fault: Code=3D15 regs=3D000000001bf58ce0 (Addr=3D00000002b08cb741)=


     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 000000029113e140 000000001066ca60 000000001d64a0=
00
r04-07  000000001ae1eb40 000000001067c260 000000001bbb74d0 000000001bf58b=
20
r08-11  0000000000000007 000000001bbb74d0 0000000000000008 00000000000000=
01
r12-15  000000001d64a238 0000000000000001 0000000000000001 00000000000000=
00
r16-19  0000000000000000 000000001bf58900 0000000010282ce8 000000001f78d6=
00
r20-23  000000001027b8e0 000000000000055c 0000000058414749 000000001d7074=
00
r24-27  00000002b08cb740 0000000000000001 0000000000000001 00000000106682=
60
r28-31  000000001d707400 000000001bf58cb0 000000001bf58ce0 00000000000000=
00
sr0-3   0000000000d91000 0000000000000000 0000000000000000 0000000000bae0=
00
sr4-7   0000000000000000 0000000000000000 0000000000000000 00000000000000=
00

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001027cf58 0000000010=
27cf5c
 IIR: 0f021014    ISR: 0000000000000000  IOR: 00000002b08cb741
 CPU:        0   CR30: 000000001bf58000 CR31: 0000000010620000
 ORIG_R28: 00000000102aa744
 IAOQ[0]: xfs_ialloc_read_agi+0x178/0x1a0
 IAOQ[1]: xfs_ialloc_read_agi+0x17c/0x1a0
 RP(r2): __gp+0x4800/0x17da0
Kernel panic - not syncing: Kernel Fault

That puts me in a deep black.

Any idea to highlight my way?

Thanks in advance,
    Joel

PS: I already tried vanilla patch 2.6.11.2 as well as Randolph patch: not=
hing
help for this pb

PS2: I also tried a bk6 merge (just in case new xfs fixes) but that crash=

very early with any messages; just adding pdc console would show a failur=
e
into new kernel/posix-cpu-timers.c
at line 1245: BUG_ON(!irqs_disabled());

>
> I was interested by xfs pb related by Grant and GMSoft and I reach to a=
lso
> obtain a corupted xfs (on a disk slice over which a reading dd doesn't
seems
> to encounter any pb).
>
> On my b180 running a 2.6.11-pa2 (cvs dated 20050310) with xfs builtin,
the
> error is always the same:
> XFS mounting filesystem sdd1
> attempt to access beyond end of device
> sdd1: rw=3D0, want=3D3130210928, limit=3D4098200
> I/O error in filesystem ("sdd1") meta-data dev sdd1 block 0xba933a68
>   ("xfs_trans_read_buf") error 5 buf count 4096
>
> >>here xfs_check ...
> >> then remount and make menuconfig
>
> XFS mounting filesystem sdd1
> attempt to access beyond end of device
> sdd1: rw=3D0, want=3D3130110864, limit=3D4098200
> I/O error in filesystem ("sdd1") meta-data dev sdd1 block 0xba91b388
>   ("xfs_trans_read_buf") error 5 buf count 4096
>
> >> here xfs_repair ...
> >> then same remount and make menuconfig
>
> XFS mounting filesystem sdd1
> attempt to access beyond end of device
> sdd1: rw=3D0, want=3D3130110864, limit=3D4098200
> I/O error in filesystem ("sdd1") meta-data dev sdd1 block 0xba91b388
>   ("xfs_trans_read_buf") error 5 buf count 4096
> ...
>
> this pb seems to be reproducible on D270, c3600 and b180 (all 32bit).
>
...


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
