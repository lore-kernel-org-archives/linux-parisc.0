Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jaguar.mkp.net (jaguar.mkp.net [66.11.169.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1A264829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 12:23:33 -0700 (MST)
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: baddy@free.fr, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] B132L+ and PCI cards
From: "Martin K. Petersen" <mkp@mkp.net>
References: <Pine.LNX.4.44.0302031815270.28090-100000@sal.ucc.ie>
Date: 03 Feb 2003 14:23:53 -0500
In-Reply-To: <Pine.LNX.4.44.0302031815270.28090-100000@sal.ucc.ie>
Message-ID: <yq1k7ghp3qu.fsf@austin.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "M" == M Grabert <xam@cs.ucc.ie> writes:

>> Unfortunately it seems that HP has a check in the firmware that
>> only allows booting with HP-branded graphics cards.

M> Not entirely correct.

It depends on your machine type and firmware version.  Older firmwares
are extremely picky.

In the first PCI-based PA-RISC machines there was a corruption bug in
Dino (the GSC-PCI bus adapter), and the firmware would disallow any
other PCI cards than HP graphics.  Newer Dinos fixed that problem and
PDC allowed 3rd party SCSI/network cards to pass.

However, when I plug in a non-HP graphics board in either C160 or
C3000, the firmware will halt the machine and ask me to pull out the
card before it will allow booting to commence.

This has nothing to do with whether Linux recognizes the card or not,
and which console driver you happen to be using.

-- 
Martin K. Petersen	Wild Open Source, Inc.
mkp@wildopensource.com	http://www.wildopensource.com/
