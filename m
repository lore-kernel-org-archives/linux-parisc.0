Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boden.synopsys.com (boden.synopsys.com [204.176.20.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD96A484E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 08:07:25 -0600 (MDT)
Received: from maiden.synopsys.com (maiden.synopsys.com [146.225.100.170])
	by boden.synopsys.com (Postfix) with ESMTP id 14019DB85
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 07:07:25 -0700 (PDT)
Received: from boston.synopsys.com (localhost [127.0.0.1])
	by maiden.synopsys.com (8.9.1/8.9.1) with ESMTP id HAA13216
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 07:07:54 -0700 (PDT)
Received: from maudettec800 (dhcp-146-225-129-157.synopsys.com [146.225.129.157])
	by boston.synopsys.com (8.9.1/8.9.1) with SMTP id KAA04675
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 10:07:23 -0400 (EDT)
From: "Michael Audette" <Mike.Audette@synopsys.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] SCSI Boot Problems on HP C110/9000
Date: Wed, 19 Jun 2002 10:07:22 -0400
Message-ID: <HMEKIKEAKEFFMJJOEAJNMEKBFIAA.maudette@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <HMEKIKEAKEFFMJJOEAJNKEJKFIAA.maudette@synopsys.com>
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

Everyone,

Thanks for the help.  I searched back in the forum another month and saw a
very similar message with a response top it that said "sounds like SCSI
termination problem".  I think this is actually a driver problem.  Both
disks are on the internal SCSI chain and internally terminated (2 GB Segate
and a Toshiba CDROM).  I did have SCSI terminator s on the external ports
(HP-UX wouldn't boot without them) (Both the Fast-Wide and the Single
Ended).

The problem suddenly went away when I removed these external SCSI
terminators.  This seems to be incorrect behavior (unless the controller
chip has built-in termination)  Anyhow,  After removing the terminators the
system booted fine.

To answer someone else's' question.  The system did not hang per se, it got
stuck in a loop trying to reset the SCSI ports.  This caused the system to
not completely boot.  Has anyone gotten external SCSI working on a C110?

					-Thanks!

						Mike


-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Michael
Audette
Sent: Tuesday, June 18, 2002 4:36 PM
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] SCSI Boot Problems on HP C110/9000


When the kernel boots it gets hung up trying to probe sda with the
following:

SCSO host 0 abort (pid 0) timed out resetting
SCSI bus is being reset for host 0 channel 9
ncr53c8xx_reset: pid 0 reset_flags=2 serial_number=84
serian_number_at_timeout=84
ncr53c720-0: suspicious SCSI data while resetting the BUS
ncr53c720-0:
dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,ath,msg,c/d,i/o=0X4020029, expecting
0x100

Any way around this.  This drive boots up just fine with the HP-UX10.20 that
is installed on it.

			-Thanks!
			   Mike


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
