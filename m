From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] 64bit kernel & nfs module: Global Offset Table
	overflow (used 1068, allowed 1023)
Date: Wed, 18 Oct 2006 22:03:11 +0200
Message-ID: <200610182203.11413.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux <parisc-linux@parisc-linux.org>
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

With a 64bit Kernel (git head):

c3000:/home/cvs# modprobe nfs
FATAL: Error inserting nfs (/lib/modules/2.6.19-rc2-pa0/kernel/fs/nfs/nfs.ko): Invalid argument

dmesg says:
nfs: Global Offset Table overflow (used 1068, allowed 1023)


In the source code arch/parisc/kernel/module.c I found:

/* Maximum number of GOT entries. We use a long displacement ldd from
 * the bottom of the table, which has a maximum signed displacement of
 * 0x3fff; however, since we're only going forward, this becomes
 * 0x1fff, and thus, since each GOT entry is 8 bytes long we can have
 * at most 1023 entries */
#define MAX_GOTS        1023

Since I don't have any real idea about GOT and modules in general:
Isn't it possible to increase this number for 64bit kernels ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
