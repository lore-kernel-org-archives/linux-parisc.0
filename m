Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mentasm.com (unknown [66.133.147.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFADB4852
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Dec 2002 14:02:47 -0700 (MST)
Received: from pc1.mentasm.com (pc1.mentasm.com [192.168.1.11])
	by mentasm.com (8.9.3/8.9.2) with ESMTP id QAA36527
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Dec 2002 16:02:38 -0500 (EST)
	(envelope-from mgandalf@mentasm.com)
From: "Mark R. Buechler" <mgandalf@mentasm.com>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Message-Id: <1041195758.2916.30.camel@pc1.mentasm.com>
Mime-Version: 1.0
Date: 29 Dec 2002 16:02:38 -0500
Subject: [parisc-linux] A3308 fibre SCSI bridge support
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

I recently purchased a SCSI bridge (4/2 A3308) thinking I could use this
with Linux but when I tried I found that it requires a driver. I can see
the MUX and all devices connected to it from an HP workstation with the
MUX driver loaded, but I'd really like to use this from Linux.

I'm wondering if anyone is working on a driver for this device and would
it work with x86 as well?

THanks, Mark.
