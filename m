Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58445482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Sep 2002 15:47:00 -0600 (MDT)
Received: from alpha.bocc.de (p5080CA95.dip.t-dialin.net [80.128.202.149])
	(authenticated)
	by mail.scram.de (8.11.6+3.4W/8.11.0) with ESMTP id g89Lkut26566
	for <parisc-linux@lists.parisc-linux.org>; Mon, 9 Sep 2002 23:46:57 +0200 (CEST)
Date: Mon, 9 Sep 2002 23:46:47 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.44.0209092343150.2394-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] definition of EWOULDBLOCK in /usr/include/asm/errno.h
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

because of the unusual definition of EWOULDBLOCK, zebra currently doesn't
work (zebra checks for EWOULDBLOCK in zebra/rt_netlink.c and will loop if
it gets EAGAIN instead and both are not the same).

I'm not sure what's the correct fix for this, change errno.h to match the
definition of the other archs or change zebra to check for EAGAIN as
well...

Cheers,
--jochen
