Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-core-5.cisco.com (sj-core-5.cisco.com [171.71.177.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0D7B4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Mar 2003 00:03:18 -0700 (MST)
Message-ID: <3E7C0AB3.9000202@cisco.com>
Date: Fri, 21 Mar 2003 23:03:15 -0800
From: Christian Suder <csuder@cisco.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] [Q] J200 recovery
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

Hello,

apologies upfront as this question is more about HW than parisc-linux, 
but as some pretty knowledgable folks hang out here I though I'll give 
it a shot.

History of the problem:

Got a J200, powered up fine but the firmware could not see the hard 
drive on the FW SCSI. It did find devices on the narrow SCSI. I also put 
in a known good drive on the FW, same thing. Both drives are HP supplied 
  Seagates (HP firmware).

Booted linux off CD and linux found the disk and could use it. 
Installation went with no problem, just could not boot off the HD. I 
could boot the system using the CD and changing root device and ramdisk 
in IPL.

While troubleshooting the boot problem I set the fastboot off - bad idea 
! Now the system stops with FLT 3000 early on.

Googling around I found that this may be a corrupted bootrom, which in 
turn may not be a true flash memory in this machine (can anybody confirm 
this ?). The battery on the mainboard is pretty much dead, but a fresh 
one didn't change anything.

Could it be the FLT 3000 is caused by the battery going dead and the 
system loosing some essential information ?

Any way to recover it ?

Thx,

	Christian
