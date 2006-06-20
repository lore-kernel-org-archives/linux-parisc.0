From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] D380 and ext[23] fs grave pb
Date: Tue, 20 Jun 2006 11:00:49 +0200
Message-ID: <J15IDD$792EA7C022C55786772856E81DA0720F@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

Hello *pa,

Making some stress test to atempt to identify some smp pb on my d380, I f=
igure
out this ext[23] relatively grave pb. Effectively during this test loop:
# while true ; do nice -n -3 tar -xspf linux-2.6.11-rc3-pa3.tar ; nice -n=
 -3 rm
-rf linux-2.6.11-rc3-pa3 ; date ; done

after about 30 iteration, I got a fs' corruption:
EXT3-fs error (device sda10): ext3_readdir: bad entry in directory #84801=
:
rec_len % 4 !=3D 0 - offset=3D0, inode=3D175234
Aborting journal on device sda10.

ext3_abort called.

EXT3-fs error (device sda10): ext3_journal_start_sb: Detected aborted jou=
rnal

Remounting filesystem read-only

EXT3-fs error (device sda10): ext3_readdir: bad entry in directory #84801=
:
rec_len % 4 !=3D 0 - offset=3D0, inode=3D1752397164, rec_len=3D24
EXT3-fs error (device sda10): ext3_readdir: bad entry in directory #84801=
:
rec_len % 4 !=3D 0 - offset=3D0, inode=3D1752397164, rec_len=3D24
[snip]

and during fsck I noticed:
__journal_remove_journal_head: freeing b_committed_data

Pass 2: Checking directory structure
Directory inode 84801, block 0, offset 0: directory corrupted
Salvage? yes

Missing '.' in directory inode 84801.
Fix? yes

Setting filetype for entry '.' in ??? (84801) to 2.
Missing '..' in directory inode 84801.
Fix? yes

[snip]

As the first time it was with a smp kernel, I re-test with up kernels onl=
y.

This pb occured with different (up) kernels (2.6.17-rc6, 2.6.14, 2.6.17 a=
nd
even with 2.6.8.1) on different fs located on different disk and differen=
t
hba, and finaly on the 2 different cpu?

That said I also get a fs corruption during a simple apt-get dist-upgrade=
:
(sdb6 being /var)
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 745764206, count =3D 1
Aborting journal on device sdb6.
ext3_abort called.
EXT3-fs error (device sdb6): ext3_journal_start_sb: Detected aborted jour=
nal
Remounting filesystem read-only
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 1869488138, count =3D 1
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 1953459744, count =3D 1
[snip]
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 2003788910, count =3D 1
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 1851878701, count =3D 1
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 1919248225, count =3D 1<3>BUG: soft lockup det
ected on CPU#0!
Backtrace:
 [<1013222c>] update_process_times+0x34/0x80
 [<1010748c>] timer_interrupt+0x9c/0x134
 [<10145f44>] handle_IRQ_event+0x5c/0xa4
 [<10146004>] __do_IRQ+0x78/0x18c
 [<10107bc4>] do_cpu_irq_mask+0x6c/0xc8
 [<1010a068>] intr_return+0x0/0xc


EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 1632635402, count =3D 1
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 1734437731, count =3D 1
[snip]
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 1313423904, count =3D 1
EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in data=
zone -
block =3D 171515972, count =3D 1
EXT3-fs error (device sdb6) in ext3_reserve_inode_write: Journal has abor=
ted
EXT3-fs error (device sdb6) in ext3_truncate: Journal has aborted
EXT3-fs error (device sdb6) in ext3_reserve_inode_write: Journal has abor=
ted
EXT3-fs error (device sdb6) in ext3_orphan_del: Journal has aborted
EXT3-fs error (device sdb6) in ext3_reserve_inode_write: Journal has abor=
ted
__journal_remove_journal_head: freeing b_committed_data

It's the only system of this model on which I can reproduce but also I ca=
n
test (and as I am not hp, I don't have passwd diagnostic cd to test hw ;-=
( ),
so it's very hard to me if it's a driver pb (e.g. ncr hba) or a hw pb?

Any idea, advises are welcome.

Thanks in advance,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
