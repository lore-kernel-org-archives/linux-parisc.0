Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0518F482A
	for <parisc-linux@parisc-linux.org>; Mon, 17 Dec 2001 06:25:17 -0700 (MST)
Received: from nyepost.start.no (nyepost.start.no [195.159.1.214])
	by smtp1.powertech.no (Postfix) with ESMTP id 155558A1A
	for <parisc-linux@parisc-linux.org>; Mon, 17 Dec 2001 14:25:16 +0100 (CET)
Received: (from apache@localhost)
	by nyepost.start.no (8.11.6/8.11.2) id fBHDFwt23336
	for parisc-linux@parisc-linux.org; Mon, 17 Dec 2001 14:15:58 +0100
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <1008594958.3c1df00ed9750@nyepost.start.no>
Date: Mon, 17 Dec 2001 14:15:58 +0100 (CET)
From: Andy Walker <squawker@start.no>
References: <1008589643.3c1ddb4b75583@nyepost.start.no>
In-Reply-To: <1008589643.3c1ddb4b75583@nyepost.start.no>
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

Quoting Andy Walker <squawker@start.no>:

> I had to pull the Bluefish F/W-Diff card (or at least disconnect the
> disk) but it may have been termination problems causing the timeouts/
> resets. Something else to test :-)

Okay, checked termination. Tried a different disk. Booted HP-UX on
that disk. No luck with Linux.

Relevant part of the dmesg is:

...
18. Bluefish Add-on FW-SCSI (4) at 0xfff8c000 [11], versions 0x13, 0x0, 0x89
...
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512

-Andy

------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
