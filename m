Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0251B4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Feb 2003 18:00:30 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h161HJp25645
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Feb 2003 17:17:19 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h1610kv07649
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Feb 2003 17:00:46 -0800
Date: Wed, 5 Feb 2003 17:00:46 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0302051700390.6804-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] nfs-root question
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

Um, have any of you set up a nfs-root client with this hp-kernel?

My palo.conf has both root=/dev/nfs nfsroot=172.16.100.7:/share/hplinux

My dhcp server is serving all the info it needs, I even added a:
option root-path "/share/hplinux" to it.


My problem is that I keep getting a panic from not being able to mount
anything.

it keeps saying that root=
which I don't beleive it should...

the dir on the server is exported {I tested it by mounting it before
trying to boot with it}

The dhcpd.conf looks like:
-------------------------------------------------------------------------
option domain-name "eng.nateng.com";
option domain-name-servers 172.16.100.7;

option subnet-mask 255.255.255.0;
default-lease-time 259200;

subnet 172.16.100.0 netmask 255.255.255.0 {
	range	172.16.100.130		172.16.100.149;
	option	broadcast-address	172.16.100.255;
	option  routers                 172.16.100.191;
}

host	hptux	{
	hardware ethernet 08:00:09:8c:02:ae;
	fixed-address	hptux.eng.nateng.com;
	option root-path "/share/hplinux";
}

my palo.conf =
--commandline=2/ HOME=/ root=/dev/nfs nfsroot=172.16.100.7:/share/hplinux ip=both
--recoverykernel=/boot/vmlinux-2.4.17-32
--init-partitioned=/dev/sda

I've set up nfs-root/diskless clients before, but I am stuck on this...
Everything looks fine, except it looks like it is forgetting the root=
option.
