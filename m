Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from eagle.grdl.noaa.gov (eagle.grdl.noaa.gov [140.90.158.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCA59482A
	for <parisc-linux@parisc-linux.org>; Wed, 27 Feb 2002 10:03:26 -0700 (MST)
Received: from eagle.grdl.noaa.gov (eagle [140.90.158.128])
	by eagle.grdl.noaa.gov (8.9.3 (PHNE_25183)/8.9.3) with ESMTP id MAA01630
	for <parisc-linux@parisc-linux.org>; Wed, 27 Feb 2002 12:03:24 -0500 (EST)
Message-ID: <3C7D115C.9AEE5DDB@eagle.grdl.noaa.gov>
Date: Wed, 27 Feb 2002 12:03:24 -0500
From: hplinux@eagle.grdl.noaa.gov
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA-RISC 0.9.3 + C200 + Visualize-EG = HPMC
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

Hello PA-RISC list,

I have successfully installed Debian 3.0/PA-RISC-Linux 0.9.3, on an
HP-9000
C200, but cannot get X working to save me. Following earlier posts to
this list
I made sure that only one screen resolution was specified in my
XF86Config-4
file (1280x1024-8, matching the stifb settings for the console) and
checked
it via "fbset -i". 

The graphics card on my C200 is a Visualize-EG (A4450A) which is, I
believe, a GSC vs. PCI card. In any case, trying to start X blanks the
screen, then a few seconds later I get a High Priority Machine Check
error as the workstation locks up. Any insights or workarounds most
appreciated!

Thanks,
John

P.S. I tried a newer kernel, 2.4.17, to no avail.
