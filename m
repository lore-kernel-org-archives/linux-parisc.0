Return-Path: <rhirst@linuxcare.com>
Received: from thinkpad.home (cpc1-hem11-4-0-cust109.lutn.cable.ntl.com
	[80.2.252.109])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BE9D48BB
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 15:03:10 -0700 (MST)
Date: Wed, 28 Jan 2004 21:25:24 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040128212524.GD17946@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org
Subject: [parisc-linux] fyi: parted now creates parisc boot partitions
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

As of parted-1.6.6-7 from your debian mirror you can now use it to set a
partition type to 'F0' for palo use.  This is done via "set N palo on",
where N is the partition number.  Thanks to Sven Luther for accepting my
patch and uploading.

Richard
