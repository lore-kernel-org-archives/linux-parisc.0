Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BE6C483D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 01:57:18 -0600 (MDT)
Date: Wed, 19 Jun 2002 08:32:10 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Michael Audette <Mike.Audette@synopsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI Boot Problems on HP C110/9000
Message-ID: <20020619073210.GD13867@sleepie.demon.co.uk>
References: <HMEKIKEAKEFFMJJOEAJNKEJKFIAA.maudette@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
> 
> Any way around this.  This drive boots up just fine with the HP-UX10.20 that
> is installed on it.

booting with "ncr53c8xx=buschk:2" will make that error turn in to a
warning, buschk:0 will say don't bother checking at all.

What do you mean by "gets hung up"?  It should just fail that scsi
controller and continue to boot.

The actual error means the scsi bus is not in an idle state following
reset, as if some device on the bus is active.  Do you have any devices
you can remove from the bus?  Is the bus terminated?

Richard
