Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CAFE482B
	for <parisc-linux@parisc-linux.org>; Thu,  1 Nov 2001 20:18:38 -0700 (MST)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id VAA30230
	for <parisc-linux@parisc-linux.org>; Thu, 1 Nov 2001 21:13:10 -0600
Date: Thu, 1 Nov 2001 21:18:31 -0600
Mime-Version: 1.0 (Apple Message framework v472)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@parisc-linux.org
Message-Id: <4A91AEBA-CF40-11D5-A1E4-0030657D1C94@bigw.org>
Subject: [parisc-linux] More Install on C110: Kernel doesn't load...
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

OK, I did a quick and dirty port of palo to MacOS X/Darwin and was able 
to run it on the ISO image and modify the boot blocks correctly.

I've got it to boot from the CD, turned out I was burning the CD wrong, 
needed to burn with Track-At-Once with Close CD, rather than simply 
Disc-At-Once in EasyCD Creator on Win2k.

However, when attempting to boot the kernel, I get this:

Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 160694 mediaptr 0x1000
Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8

Error: read from boot device failed (status = -4)
byteio_read: seekread() returned -1 expected 2048
Error:  segment 0 read() failed

Any thoughts?

Thanks,
Dan
