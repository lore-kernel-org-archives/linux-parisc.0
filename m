Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01B0D482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 14:26:32 -0700 (MST)
Message-Id: <200211172126.gAHLQRxs018282@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [2.5] next issues ...
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Sun, 17 Nov 2002 16:26:27 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.44.0211172053420.39295-100000@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at Nov 17, 2002 09:13:15 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> that fast *waeehhh* someone missed that last zero at 715/100(0) 8-(

Yes, full bootstrap and check is close to 24 hours on 100MHz machines.

> do_page_fault() pid=22502 command='conftest' type=15 address=0x40019000
> vm_start = 0x40018000, vm_end = 0x40019000

Faults involving conftest are probably ok.

> no bash, nowhere, never, not as dflt ! 2> /dev/null ;-))

What's /bin/sh?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
