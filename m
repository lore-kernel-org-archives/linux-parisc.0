Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DC214848
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 01:21:49 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17KZml-0001Ek-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 08:21:47 +0100
Date: Wed, 19 Jun 2002 08:21:47 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI Boot Problems on HP C110/9000
Message-ID: <20020619072147.GB1244@tykepenguin.com>
References: <HMEKIKEAKEFFMJJOEAJNKEJKFIAA.maudette@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
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

On Tue, Jun 18, 2002 at 04:35:48PM -0400, Michael Audette wrote:
> When the kernel boots it gets hung up trying to probe sda with the
> following:
> 
> SCSO host 0 abort (pid 0) timed out resetting
> SCSI bus is being reset for host 0 channel 9
> ncr53c8xx_reset: pid 0 reset_flags=2 serial_number=84
> serian_number_at_timeout=84
> ncr53c720-0: suspicious SCSI data while resetting the BUS
> ncr53c720-0:
> dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,ath,msg,c/d,i/o=0X4020029, expecting
> 0x100
 
I got something very similar when I had a SCSI-1 CD-ROM driver attached to the
external SCSI port. When I unplugged it it went away and the system booted fine
though.

This was with the Debian 2.4.17 kernel.

patrick
