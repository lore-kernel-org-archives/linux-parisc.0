Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from grerelbul01.net.external.hp.com (grerelbul01.net.external.hp.com [192.6.111.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6AE1A4879
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Sep 2003 03:29:17 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by grerelbul01.net.external.hp.com (Postfix) with ESMTP id 0076A381B7
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Sep 2003 11:29:16 +0200 (CEST)
Received: from hp.com (ssdpc48.france.hp.com [15.129.234.2])
	by hpfrcu03.france.hp.com (8.9.3 (PHNE_28810)/8.9.3 SMKit7.02) with ESMTP id LAA04250
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Sep 2003 11:29:15 +0200 (METDST)
Message-ID: <3F65866B.7020206@hp.com>
Date: Mon, 15 Sep 2003 11:29:15 +0200
From: Bruno Vidal <bruno_vidal@hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Kexec for pa-risc
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
I'm still looking to speed up dump creation. One solution (and with
less re-work) is to dump directly in memory, mark pages as
reserved, reboot a brand new kernel with an add-on to still
have dump pages marked as reserved (without clearing memory,
by-passing bios, etc...), and then use the standart
disk driver to flush the dump, and then release the pages.

I think that main part of the job has already been done with
kexec, does someone already looked at it to port on pa-linux ?

     Cheers.

-- 
	Vidal Bruno, (770-4271)
         SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@hp.com
