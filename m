Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D2E2482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 14:45:22 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D8CA@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 11 Oct 2001 15:44:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: [parisc-linux] new scsi drivers...
List-ID: <linux-parisc.vger.kernel.org>

Well, just updated my j210, and it seems to work ok, but for one tiny
detail. (Well, not really a problem, just a heads-up.)

The ordering of scsi devices changes with this new driver.

My J210 has two narrow scsi disks (4,5) (booting off 4), and two wide (5,6).
They showed up previously as "sda, sdb, sdc, sdd" respectively. Now they are
"sdc, sdd, sda, sdb".

Not a problem once I realized what was happening. Just keep aware of this in
case anyone else sees similar problem.

I must say though - very nice work with palo's edit at boot mode... 

FYI - The LCD is working great on the j210 now as well. 

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216
