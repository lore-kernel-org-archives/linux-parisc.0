Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 742D64829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 11:30:44 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h3EHUg603874
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 18:30:42 +0100
Date: Mon, 14 Apr 2003 18:30:41 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0304141801320.14551-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] installation problems on RDI Precisionbook
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

Hi PA,

I'm trying to install Debian on my (recently purchased) Precisionbook
(256MB RAM, 4 GB hard disk, Visualize-EG, basically a B160 as a laptop;
 no serial console possible due to missing adapter cable).

I using the net-install CD from EISEE
(palinux-2.4.20-pa32-20030322-netinst.iso). It boots up (identifies the
system correctly as a model 9000/778/B160L) and stops/hangs at the
following line (at least it passes the 'Branching to kernel entry point'
message):

[...]
LED display at f0190001 registered
Kernel command line: ramdisk_size=8192 root=/dev/ram console=tty0 sti=8/24
 sti_font=VGA8x16 TERM=linux palo_kernel=0/vmlinux
Console: colour dummy device 160x64

I waited for 30mins, but nothing else happened. Is there a known problem
with this particular kernel/ISO-image? Any hints what I can try out to
succeed installing/boot Linux on the machine?

Thanks, max
