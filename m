Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from caci.com (mailserver1.caci.com [204.194.72.241])
	by dsl2.external.hp.com (Postfix) with ESMTP id DFFC9482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jul 2003 14:03:01 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OFBFF3F544.D370F16B-ON05256D60.006D05BF@caci.com>
From: "Matt Standish" <mstandish@caci.com>
Date: Fri, 11 Jul 2003 15:01:16 -0500
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Installing - creating superblock locks up
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

Hello-
I am trying to install the latest net install ISO's.

My system is labeled Apollo Series 700 but the info command gives the following
Machine model 9000/730
Hardware version 8224
Software Version 1153

On bootup I see it has
PDC rom 2.0
IODC rom 2.0
176M ram

The SCSI controller is labeled SCSI Single ended.

Looking at the machine I can see it contains a  A1659-66001 video (frame buffer).  I am assuming this is not stock as the documentation on HP's web site states nothing about it.

My machine locks up (no heartbeat) when creating superblocks for formatting the hard drives.  I have tries this on many different drives and receive the same results.

I have read the FAQ and googled the archives to death.  If anyone can point me the right direction, It would be a great help.  I have 5 of these machines.

-Matt
