Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F2CD482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 01:20:45 -0600 (MDT)
To: Michael Audette <Mike.Audette@synopsys.com>
Subject: Re: [parisc-linux] SCSI Boot Problems on HP C110/9000
Message-ID: <1024471228.3d1030bc9e9e8@webmail.tiscalinet.be>
Date: Wed, 19 Jun 2002 09:20:28 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <HMEKIKEAKEFFMJJOEAJNKEJKFIAA.maudette@synopsys.com>
In-Reply-To: <HMEKIKEAKEFFMJJOEAJNKEJKFIAA.maudette@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Michael Audette <Mike.Audette@synopsys.com>:


> SCSI bus is being reset for host 0 channel 9
> ncr53c8xx_reset: pid 0 reset_flags=2 serial_number=84
> serian_number_at_timeout=84
> ncr53c720-0: suspicious SCSI data while resetting the BUS
> ncr53c720-0:
> dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,ath,msg,c/d,i/o=0X4020029,
> expecting
> 0x100
> 

External disk? (scsi id 9?)
If it is an external disk, check the scsi chaine (frequently no or not proper
scsi terminator).
If it is an internal disk, check that entension connector are also 'closed' by
proper scsi terminator.

Good luck,
    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
