Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01175482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 07:09:20 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 878CCB00C; Thu, 12 Jul 2001 14:07:56 +0100 (BST)
Date: Thu, 12 Jul 2001 14:07:56 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems with checksums
Message-ID: <20010712140756.C18375@linuxcare.com>
References: <001201c10ad2$3beb97b0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001201c10ad2$3beb97b0$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Thu, Jul 12, 2001 at 08:57:40AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 12, 2001 at 08:57:40AM -0400, rpengelly wrote:
> I've downloaded the 0.92 install. I ran the md5sum on it and it wasn't correct. I'm wondering if the problem is that I am downloading to a windows box and then transferring it to a linux box for netbooting? would this cause problems with the checksums?

The md5sum is for the .gz file:

[root@beast current]# md5sum /mnt/parisc/palinux-0.9.2.iso.gz 
45b3f776f5e702b02a9e02cd10358c99  /mnt/parisc/palinux-0.9.2.iso.gz
[root@beast current]# md5sum /mnt/parisc/palinux-0.9.2-install.iso.gz 
a7819f5fc2f5418bcdcb1de3068baade  /mnt/parisc/palinux-0.9.2-install.iso.gz

As they are gzipped files, "gzip -tv <filename>" would also verify
that they downloaded correctly.  I have known some browsers 'helpfully'
uncompress .gz during download.  If you only have the uncompressed
versions the sums should be:

[root@beast current]# zcat /mnt/parisc/palinux-0.9.2.iso.gz | md5sum
b7f13d7175744e2d204a738f2ab32bc2  -
[root@beast current]# zcat /mnt/parisc/palinux-0.9.2-install.iso.gz | md5sum
c7e3f1312ea387a27b7ec3b278850ac0  -


Richard
