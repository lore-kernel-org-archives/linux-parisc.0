Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B672482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 14:27:04 -0700 (MST)
Subject: Re: [parisc-linux] gcc-3.x and the kernel
To: xam@student.cs.ucc.ie (Markus Grabert)
Date: Mon, 19 Nov 2001 21:34:36 +0000 (GMT)
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.OSF.4.41.0111191946450.11606-100000@student.cs.ucc.ie> from "Markus Grabert" at Nov 19, 2001 07:55:28 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E165w3o-0007mB-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> But I've read that gcc-3.0.x is not officially supported as a kernel
> compiler, since is still has some bugs. Are these bugs just x86 related
> (I doubt it) or do you accept the risk that gcc might produce garbage ?

The advice is basically x86 - for example gcc 3.0.1 gives a compiler error
trying to build some 2.4 drivers right now. With the ports it varies - the
parisc tree uses its own compiler chain based on gcc 3.
