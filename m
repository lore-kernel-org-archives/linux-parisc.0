Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A892482C
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 15:06:54 -0700 (MST)
Received: from eiger.apptechsys.com (ats198.apptechsys.com [207.14.35.198])
	by mail.apptechsys.com (Postfix) with ESMTP id 68A9A7BC46
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 14:06:47 -0800 (PST)
Date: Mon, 25 Mar 2002 14:06:47 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33L2.0203251403190.13376-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Building cvs 2.4.18
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

I just checked out the latest cvs and I am trying to build it.
I copied the arch/parisc/debian-configs/32-smp to .config and ran
make-kpkg -rev jeremyd.0 kernel_image .  It clicks away for a while and
then dies on pcnet32.  I don't need pcnet32, so I removed it from the
config and went on.  Everything build successfully, but the depmod died.
Here's the output

depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.18-pa8/kernel/net/ipv4/netfilter/ip_tables.o
depmod:         smp_num_cpus
depmod:         __cpu_number_map
depmod: *** Unresolved symbols in
/usr/src/linux/debian/tmp-image/lib/modules/2.4.18-pa8/kernel/net/ipv4/netfilter/ipchains.o
depmod:         smp_num_cpus
depmod:         __cpu_number_map
make[2]: *** [_modinst_post] Error 1


-- 
Endless the world's turn, endless the sun's spinning
Endless the quest;
I turn again, back to my own beginning,
And here, find rest.
