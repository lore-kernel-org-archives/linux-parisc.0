Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hp (IP-213157009128.dialin.heagmedianet.de [213.157.9.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07E6F4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 08:30:16 -0600 (MDT)
Received: from dreamind by hp with local (Exim 3.36 #1 (Debian))
	id 17mbAb-0001Dn-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 04 Sep 2002 16:30:13 +0200
Date: Wed, 4 Sep 2002 16:30:13 +0200
From: Stefan Pfetzing <dreamind@dreamind.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020904143013.GC4386@dreamind.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] XFS - blkgetsize64
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

Hi,

I just tried to get XFS working on my C200 (I've got a new IBM SCSI disk.) and
mkfs.xfs always got the size of the Device (/dev/sda5) wrong. (it complained
about not getting with lseek64 to that position...)
(I don't have the correct error message ready, but I can check, if its needed)

After I changed the libxfs to only use the BLKGETSIZE64 ioctl, it works fine
now. (Eric Sandeen pointed me to this)

So he said, perhaps there is a bug in the SCSI (lasi?) driver.

bye

Stefan

P.S.: I'm using 2.4.19-pa9 with a self made diff from vanilla 2.4.19 against
XFS CVS. (the patch did in nearly cleanly)
-- 
        http://www.dreamind.de/
Oroborus and Debian GNU/Linux Developer.
