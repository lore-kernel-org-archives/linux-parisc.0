Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42F5E4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 09:29:39 -0700 (MST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3A7ED4DA.FB3BD30C@alcatel.at>
Date: Mon, 05 Feb 2001 17:29:14 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: zhao <qzhao@nc.rr.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Pa-linux install hangs on a HP 9000 712/100
References: <39F24A52.4B7541DE@nc.rr.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

How is your console defined ?
console=ttyS0 ?

You should check the command line which is passed by palo
to the kernel !

	Christoph

zhao wrote:
> 
> Thanks for the former help. Now I can boot the machine.
> 
> I tried to install PA linux on to this machine.
> When the installation starts, everythins seems fine,
> The devices are recongnized correcttly.
> My SCSI HD is on 0.0.
> It hangs after booting, the last message the installer gave is:
> Switching from PDC console.
> 
> Do anyone have any idea about this?
> 
> Thanks,
> 
> zhao
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
