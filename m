Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B7424867
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 02:23:03 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17SZE3-0003fQ-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 09:22:59 +0100
Date: Thu, 11 Jul 2002 09:22:59 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020711082259.GF822@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Subject: [parisc-linux] O_DIRECT on devices
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

I'm currently working on LVM2 and we want to use O_DIRECT to write the metadata
from userspace. so I open a partition with O_DIRECT and try to read/write the
data from an aligned buffer.

This works fine on Alpha & Intel but seems very unreliable on parisc for some
reason. Sometimes it works, sometimes it oopses "do_page_fault() pid=2120
command='lvm' type=15 address=0x00000001" and sometimes I just get back the
wrong information (at least LVM thinks its wrong I haven't check in detail just
what is up with it).

I haven't tried writing yet - I'd rather not think what might happen to my disk
just ATM :)

This is a C110 with 256meg of memory running 2.4.18-pa46

patrick
