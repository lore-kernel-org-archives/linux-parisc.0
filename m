From: Richard Hirst <rhirst@linuxcare.com>
Subject: [parisc-linux] fyi: parted now creates parisc boot partitions
Date: Wed, 28 Jan 2004 21:25:24 +0000
Message-ID: <20040128212524.GD17946__27047.0110852786$1416623159$gmane$org@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <rhirst@linuxcare.com>
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
