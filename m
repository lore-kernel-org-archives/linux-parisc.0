Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boden.synopsys.com (boden.synopsys.com [204.176.20.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79D7C482F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Jun 2002 14:35:59 -0600 (MDT)
Received: from maiden.synopsys.com (maiden.synopsys.com [146.225.100.170])
	by boden.synopsys.com (Postfix) with ESMTP id C24D3DD55
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Jun 2002 13:35:58 -0700 (PDT)
Received: from boston.synopsys.com (localhost [127.0.0.1])
	by maiden.synopsys.com (8.9.1/8.9.1) with ESMTP id NAA12472
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Jun 2002 13:36:27 -0700 (PDT)
Received: from maudettec800 (dhcp-146-225-129-157.synopsys.com [146.225.129.157])
	by boston.synopsys.com (8.9.1/8.9.1) with SMTP id QAA12068
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Jun 2002 16:35:55 -0400 (EDT)
From: "Michael Audette" <Mike.Audette@synopsys.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Tue, 18 Jun 2002 16:35:48 -0400
Message-ID: <HMEKIKEAKEFFMJJOEAJNKEJKFIAA.maudette@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] SCSI Boot Problems on HP C110/9000
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
