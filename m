Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 433E64830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jun 2003 11:51:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19Q9kc-0003JX-Cj; Wed, 11 Jun 2003 18:51:10 +0100
Date: Wed, 11 Jun 2003 18:51:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
Message-ID: <20030611175110.GE28581@parcelfarce.linux.theplanet.co.uk>
References: <3ED4C8B600004A2B@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED4C8B600004A2B@ocpmta1.freegates.net>
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

On Wed, Jun 11, 2003 at 07:46:54PM +0200, Joel Soete wrote:
> Anoyed to change my fstab because I add or remove a disk to/from the external
> scsi controler of my b2k (boot disk sda became sdb, sdc, or what else),
> I decide so to test devfs kernel. It seems to works (excepted that I could
> not specify root=/dev/scsi/host1/bus0/target5/lun0/part5)

(a) devfs is shit.  do not use it.
(b) even if it's compiled in, the kernel still matches `root=' against a
built-in table that has nothing to do with devfs.
(c) devfs is shit.  do not use it.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
