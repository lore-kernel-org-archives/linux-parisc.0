Return-Path: <lists@fop.ns.ca>
Received: from brain.fop.ns.ca (u135n18.eastlink.ca [24.224.135.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 987424866
	for <parisc-linux@parisc-linux.org>;
	Thu,  1 Jan 2004 14:55:09 -0700 (MST)
Received: from lists (helo=localhost)
	by brain.fop.ns.ca with local-esmtp (Exim 3.35 #1 (Debian))
	id 1AcAmb-000738-00
	for <parisc-linux@parisc-linux.org>; Thu, 01 Jan 2004 17:55:09 -0400
Date: Thu, 1 Jan 2004 17:55:08 -0400 (AST)
From: Steve Bromwich <hppa@fop.ns.ca>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.58.0401011742320.26846@brain.fop.ns.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Mailing Lists <lists@fop.ns.ca>
Cc: 
Subject: [parisc-linux] Disk hanging problems with 715/100XC fixed
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

A while ago I posted here about problems I had with my machine hanging
under heavy disk activity. After getting a round tuit for Christmas, I
finally traced it down to one of the drives (a Quantum Fireball) not being
able to support maximal values for TCQ, as referenced in Configure.help
for CONFIG_AIC7XXX_OLD_CMDS_PER_DEVICE:

  NOTE: Certain very broken drives are known to lock up when given
  more commands than they like to deal with. Quantum Fireball drives
  are the most common in this category. For the Quantum Fireball
  drives it is suggested to use no more than 8 commands per device.

To help anyone googling keywords with the same problem, my drive
(according to /proc/scsi/scsi) is:

Host: scsi0 Channel: 00 Id: 02 Lun: 00
  Vendor: QUANTUM  Model: FIREBALL-ST2     Rev: HP0J
  Type:   Direct-Access                    ANSI SCSI revision: 02

I fixed this by setting NCR_700_MAX_TAGS to 8 in drivers/scsi/53c700.h.
Hopefully this will help anyone else who has the same problem! My machine
has now been up and running for 5 days quite happily, whereas before it
wouldn't last longer than 24 hours.

Cheers, Steve
