Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6447148CA
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  3 Feb 2004 22:19:30 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 65AB9298050
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  3 Feb 2004 22:19:29 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 16077-01 for <parisc-linux@lists.parisc-linux.org>;
	Tue, 3 Feb 2004 22:19:28 -0700 (MST)
Date: Tue, 3 Feb 2004 22:19:28 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040204051928.GA16054@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HP1825 and PCI Vis-EG at 1600x1200
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I just recently got an HP 1825 Flat panel display.
The documentation says the panel supports 1600x1200 resolution
via analog (not DVI) input at 75Khz Hsync, 60Hz refresh (Vsync).

Anyone already know if PCI Vis-EG card can output that?
If so how? Maybe some sort of custom "mode line" in PDC?
I'm looking for concrete steps, not speculation.

I'll hunt a bit more on the internet since I'm pretty sure
I've seen some of the HP parisc workstations allow for
a "custom" video output but don't know if Vis-EG allows
that or where the steps to do it are described.

thanks,
grant
