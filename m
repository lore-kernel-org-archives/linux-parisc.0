Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5051D482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 03:16:52 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7C078B00C; Tue, 16 Oct 2001 10:17:16 +0100 (BST)
Date: Tue, 16 Oct 2001 10:17:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Daniel Engstrom <5116@telia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committed
Message-ID: <20011016101716.A11105@linuxcare.com>
References: <20011008230949.U11105@linuxcare.com> <20011013233216.A24926@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011013233216.A24926@zaphod.halden.lillfab.se>; from 5116@telia.com on Sat, Oct 13, 2001 at 11:32:16PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 13, 2001 at 11:32:16PM +0200, Daniel Engstrom wrote:
> 
> Hi, Richard.
> 
> On 2001.10.09 00:09 Richard Hirst wrote:
> >   I've just added a new scsi driver for 53c700 and 53c710 chips to cvs.
> 
> I have some problems with this driver on my 715-50/old installed from the 
> 0.92 cd.

We've had one problem report so far that was fixed by adding a scsi
terminator.  The new driver runs fast sync scsi transfers, while the
old one ran slower async.  Poorly terminated scsi busses are much more
likely to fail with the new driver.  James Bottomley posted a patch to
disable sync transfers a few days ago, could you try that and see if
it helps?  Also let us know what you system has by way of scsi termination.

Thanks,
  Richard
