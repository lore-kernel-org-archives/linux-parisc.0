From: "Harry Cochran" <h.cochran@comcast.net>
Subject: [parisc-linux] Upgrading from 2.4 to 2.6
Date: Wed, 23 Feb 2005 16:27:55 -0500
Message-ID: <FHEGKPBPFFGIFBGOANOKGENAEPAA.h.cochran@comcast.net>
References: <20050222210531.6c4fccc2@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: <parisc-linux@parisc-linux.org>,
 <debian-hppa@lists.debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050222210531.6c4fccc2@Tatooine.r3z0>
List-Id: linux-parisc.vger.kernel.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Newbie mistake #1 was that I had the wrong (i386) cd. Now I can boot from
the hppa cd. However, the partition where I have /boot, SDA1, is listed
as -- Not Available --. So, I can't back out of the 2.6 install easily. Any
help on how to recover from here would be greatly appreciated.


Hi,

	Could someone please help me recover from a failed attempt to upgrade my
J6000 to 2.6?

	Looks like I can't boot the 2.4 kernel I have on the system because it's
name doesn't end in 32 or 64 (it ends in smp) -><-.

	My J6000 has a cd-rom, so I thought maybe I could boot from that, but sea
ipl doesn't find it.

Here's my original question:

*************

	Sorry for the newbie question, but I'm trying to boot 2.6 and I don't quite
understand how to set up the "root=" for it.

My palo.conf says:
--command line=1/boot/vmlinux root=/dev/sda3 HOME=/ initrd=/initrd.img
console=ttyS0 TERM=vt102
--recoverykernel=/boot/vmlinux
--init-partitioned=/dev/sda

Here's what my palo.conf generates on boot right now:

0 1/boot/vmlinux
1 root=/dev/sda3
2 HOME=/
3 initrd=/initrd.img
4 console=ttys0
5 TERM=vt102

On boot I get:

cannot open root device "sda3" or unknownblock(2.0)
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs or unknown-block(2.0)

	I have seen one document which says I have to build a ramdisk, but it
doesn't tell me how. What's worse is that I can't get 2.4.26 to boot again
even though I have a symlink (vmlinux.old) to it. I tried changing line 0 to
1/boot/vmlinux.old (and deleting the "initrd=/initrd.img" line, but it still
boots 2.6.8. I even tried inserting a line saying
recoverykernel=/boot/vmlinux.old but that didn't help.

*************

	I'm sure there's an easy answer and maybe everyone is tired of answering
these kind of newbie questions, but I'm desperate, so I thought I'd try one
more time.

Thanks,

Harry


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
