Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78BD5482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Jun 2001 02:58:32 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BDA22B007; Wed, 13 Jun 2001 09:54:13 +0100 (BST)
Date: Wed, 13 Jun 2001 09:54:13 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matteo Boschini <boschini@cilea.it>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problem installing on HP735
Message-ID: <20010613095413.A16532@linuxcare.com>
References: <Pine.LNX.4.21.0106131025410.876-100000@boschini.sede.cilea.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0106131025410.876-100000@boschini.sede.cilea.it>; from boschini@cilea.it on Wed, Jun 13, 2001 at 10:29:15AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jun 13, 2001 at 10:29:15AM +0200, Matteo Boschini wrote:
> 
> Hi all, 
> I read the FAQs and browsed the mailing list, but wasn't able to find
> anything similar...
> 
> I have an HP/735, with an external SE SCSI CD-ROM and serial console.
> I downloaded palinux-0.9-32serial.iso and burnt my own CD (well 2 of them,
> just in case..) and I can not even boot from CD, getting 
> 
> bad IPL checksum
> 
> the CD i have is a Toshiba XM 3301TA.
> 
> Any help ?

Can you read the CD on other systems?  If you can, I'd suspect that
the firmware dowsn't like your CD drive, or there is some cable or
otehr h/w problem.  You could boot the system over the network, and
see if linux can then install from the CD.

Richard
