Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73E0E4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 17:15:35 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CE81AB005; Thu,  8 Feb 2001 00:16:00 +0000 (GMT)
Date: Thu, 8 Feb 2001 00:16:00 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "arete@libero.it" <arete@libero.it>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 715 Scsi problem
Message-ID: <20010208001600.N1374@linuxcare.com>
References: <G8EVSH$ItXBrdOYjzLNbA0pZ4vAxouFJhE3D12QZe8gLNeQV@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <G8EVSH$ItXBrdOYjzLNbA0pZ4vAxouFJhE3D12QZe8gLNeQV@libero.it>; from arete@libero.it on Thu, Feb 08, 2001 at 12:55:29AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 08, 2001 at 12:55:29AM +0100, arete@libero.it wrote:
> I have compilated the kernel 20010201 , with xc-20010201
> and i have scsi and ethernet problem....
> 
> thanks


> SCSI subsystem driver Revision:1.00
> busdevice_alloc_irq(0xc02ac6f4): No LASI/ASP/WAX found in system yet !
> sim700:Couldn't get consistent shared memory
> sim700:Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 0, options 1

Something strange there - IRQ 0 means sim700_init_host() was called
with requested_irq=0.  Shouldn't happen.  I'll try my 715/75 tomorrow.
Which model of 715 have you got?

Richard
