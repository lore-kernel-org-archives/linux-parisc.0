Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4104B4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 17:25:44 -0600 (MDT)
Message-ID: <3D8516EF.7A7D8206@gmx.at>
Date: Mon, 16 Sep 2002 01:25:35 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Status SPIFI SCSI
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

Hallo Ryan,

here some comments on my non-successful work so far.

I did code reading and used debug instrumented code
to understand the structure behind the linux SCSI
handling.

Further I studied the NetBSD code. 

One major point: We do not get any interrupts.
For my analysis I only had a look on the first
steps of SCSI initialization, so this was the
INQUERY command.

The spifi command routine is called correctly,
but it has a wrong logical implementation. As I 
have seen on other (older) linux driver, the
xxx_command() has to block, after the command was
successful completed by interrupt. But the interrupt
never comes !! Even a "long" delay for simulating
blocking does not solve this problem.
