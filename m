Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE968482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Mar 2002 15:56:39 -0700 (MST)
Received: from hpindda.cup.hp.com (hpindda.cup.hp.com [15.13.95.92])
	by palrel13.hp.com (Postfix) with ESMTP id 8E92C40073C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Mar 2002 14:56:36 -0800 (PST)
Received: from cup.hp.com (maverick.cup.hp.com [15.13.105.84])
	by hpindda.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with ESMTP id OAA02743
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Mar 2002 14:56:31 -0800 (PST)
Message-ID: <3C8D3619.519A601C@cup.hp.com>
Date: Mon, 11 Mar 2002 14:56:25 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: parisc <parisc-linux@lists.parisc-linux.org>
References: <20011001175425.A31305@dogbert.localdomain> <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de> <20011005222028.A13585@dogbert.localdomain> <20011005215600.B3745@parcelfarce.linux.theplanet.co.uk> <20011005233602.A13826@dogbert.localdomain>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] new vmlinux!!!
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

I have 3 partitions on primary disk
   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1        95     97264   f0  Linux/PA-RISC boot
/dev/sda2            96       339    249856   82  Linux swap
/dev/sda3           340      8683   8544256   83  Linux

I am doing some modifications to the code and trying to boot with a new
linux.
I placed my vmlinux in /boot, but the palo doesn't seems to recognize my
kernel.

Any suggestions.

Guru
