Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.unitec.edu (mail.unitec.edu [216.72.84.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04EE64829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 11:20:33 -0700 (MST)
Received: from unitec.edu ([127.0.0.1]) by mail.unitec.edu
          (Netscape Messaging Server 4.15) with ESMTP id HCS55W00.AXX for
          <parisc-linux@lists.parisc-linux.org>; Thu, 3 Apr 2003 12:10:44 -0600
From: "Ricardo Jose Guevara Ochoa" <jguevara@unitec.edu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <4dfbf44c74795b8f.74795b8f4dfbf44c@unitec.edu>
Date: Thu, 03 Apr 2003 12:10:44 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Kernel boot error
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

I tried to boot the linux kernel 2.4.20pa32, and it gave me this error:

Boot device can't seek past 2gb( ignore next error ).byteio_read: 
seekreed()return -1 excepted 2048
ext2_get:read errorError: open /kernel/linux/vmlinux from partition 2 
failed

any ideas?

Ricardo J Guevara
