Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56054482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Sep 2002 14:53:41 -0600 (MDT)
Date: Sat,  7 Sep 2002 15:49:50 -0500
Message-Id: <200209071549.AA99484160@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Bus Speed
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

When Linux starts up I see a message saying:

ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx

I have a C180 and the bus speed at startup says:

Central Bus Speed (in MHz) :        120

so I'm assuming I should add the boot parameter as mentioned above.
Will I see any performance gain?

Thanks,
-Marc
