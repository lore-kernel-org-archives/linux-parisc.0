From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] xfs module in vmlinux-2.6.11-pa2-a500_defconfig
Date: Fri, 11 Mar 2005 11:58:10 +0100
Message-ID: <4208D5150000D882@mail-5-bnl.tiscali.it>
References: <16941.28518.183984.44335@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Matthias Klose" <doko@cs.tu-berlin.de>,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <16941.28518.183984.44335@gargle.gargle.HOWL>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Matthias,

...
> 
> the xfs module in vmlinux-2.6.11-pa2-a500_defconfig doesn't load:
> 
for my part I use a builtin driver on a b180 (kernel 2.6.11-pa2 cvs dated=

20050307)

> xfs: Global Offset Table overflow (used 1061, allowed 1023
> modprobe: FATAL: Error inserting xfs (/lib/modules/2.6.11-pa2/kernel/fs=
/xfs/xfs.ko):
> Invalid argument
> 
> the reason for the update was a problem with the
> vmlinux-2.6.8.1-pa11-a500_defconfig kernel, which I see from time to
> time ...
> 
> mount: /dev/sdb5
> : can't read superblock
> 
> running xfs_repair fixes the problem and the filesystem can be
> mounted.
> 
Any way after severall (about 3) working days (more then 3 cvs co, more t=
ar
xjvpf ..., patch, diff, ...) on such xfs, I encounter some I/O errors whi=
le
trying to apply a patch:
sdd1: rw=3D0, want=3D3129722848, limit=3D4098200
I/O error in filesystem ("sdd1") meta-data dev sdd1 block 0xba8bc7d8    
  ("xfs_trans_read_buf") error 5 buf count 4096

fwiw just umount xfs_check and 're-'mount this xfs and all seems to work
fine again.

hth,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
