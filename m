Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60C39482A
	for <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 04:37:34 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 99553B00C; Wed, 19 Dec 2001 11:36:21 +0000 (GMT)
Date: Wed, 19 Dec 2001 11:36:21 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Andy Walker <squawker@start.no>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <20011219113621.X1897@linuxcare.com>
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <1008594958.3c1df00ed9750@nyepost.start.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1008594958.3c1df00ed9750@nyepost.start.no>; from squawker@start.no on Mon, Dec 17, 2001 at 02:15:58PM +0100
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

On Mon, Dec 17, 2001 at 02:15:58PM +0100, Andy Walker wrote:
> Quoting Andy Walker <squawker@start.no>:
> 
> > I had to pull the Bluefish F/W-Diff card (or at least disconnect the
> > disk) but it may have been termination problems causing the timeouts/
> > resets. Something else to test :-)
> 
> Okay, checked termination. Tried a different disk. Booted HP-UX on
> that disk. No luck with Linux.
> 
> Relevant part of the dmesg is:
> 
> ...
> 18. Bluefish Add-on FW-SCSI (4) at 0xfff8c000 [11], versions 0x13, 0x0, 0x89
> ...
> zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
> ncr53c8xx: 53c720 detected
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> scsi0 : ncr53c8xx-3.4.3b-20010512

Don't know why that is failing; does it always fail, or is it an
intermittant problem?  e.g. Are the disks detected at boottime?

You might try booting with something like

ncr53c8xx=sync:255,burst:0,verb:2

which slows it down and might help if it is intermittant (just guessing though)

Richard
