Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD9001DCC.dip.t-dialin.net [217.0.29.204])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CD624832
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 05:59:20 -0700 (MST)
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
From: andi <andi@fischlustig.de>
To: Duraid Madina <duraid@fl.net.au>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <000301c1c654$78ae35c0$022a17ac@simplex>
References: <000301c1c654$78ae35c0$022a17ac@simplex>
Date: 08 Mar 2002 13:58:29 +0100
Message-Id: <1015592309.2580.37.camel@cube>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

> Can parisc linux swap over NFS?

no, swapping over nfs does not work, however, using network block device
should work, and is much faster than nfs.

do do that you need to enable network block device in the client's
kernel, and you need two special userspace tools (debian packages
nbd-server and nbd-client). the nbd-server in debian is broken you
should get the latest upstream version and compile it yourself.

good luck

andi
