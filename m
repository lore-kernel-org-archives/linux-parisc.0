Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4C9C4882
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 May 2003 05:08:04 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id E28BD6E
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 May 2003 13:08:02 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2])
	by hpfrcu03.france.hp.com (8.9.3 (PHNE_26305+JAGae58098)/8.9.3 SMKit7.02) with ESMTP id NAA08761
	for <parisc-linux@lists.parisc-linux.org>; Mon, 5 May 2003 13:07:57 +0200 (METDST)
Message-ID: <3EB6460D.6040704@admin.france.hp.com>
Date: Mon, 05 May 2003 13:07:57 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] dump module: new feature
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

	Hi
For people who are intersting to it, the dump modules
is now checking that it is a swap device before
configuring it. So it remove the risk to dump
to a file system. It check for the swap magic
"SWAP-SPACE" (v0) or "SWAPSPACE2" (v1). The
partition is not necessary an active one,
it should only be created by mkswap (so no
file system on it).

	Cheers.

-- 
	Vidal Bruno, (770-4271)
         SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
