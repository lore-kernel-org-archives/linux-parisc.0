Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 644E24898
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 07:04:54 -0700 (MST)
To: "Duraid Madina" <duraid@fl.net.au>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
From: "Martin K. Petersen" <mkp@mkp.net>
References: <000301c1c654$78ae35c0$022a17ac@simplex>
Date: 08 Mar 2002 09:04:47 -0500
In-Reply-To: <000301c1c654$78ae35c0$022a17ac@simplex>
Message-ID: <yq1it87w3y8.fsf@austin.mkp.net>
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

>>>>> "Duraid" == Duraid Madina <duraid@fl.net.au> writes:

Duraid> In particular, I'm wondering about 3ware IDE RAID cards (these
Duraid> work in (at least) alpha and x86 linux)

I don't think there are high hopes for the 3ware card.  At least not
unless you preconfigure it on a PC.

Alpha happens to work because its firmware includes a simple x86
simulator that executes the BIOS code on the card.  That way you can
configure your disk setup, etc.

We don't have similar functionality on PA-RISC.  So you are limited
what can be done from within Linux. 

Unfortunately the 3ware management utility is 386 binary-only.
I.e. you can't configure the card once you get Linux up and running
either.

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
