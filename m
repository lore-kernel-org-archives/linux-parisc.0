Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id D45194840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Jun 2001 18:39:49 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9FA1CB00C; Sun, 17 Jun 2001 01:41:18 +0100 (BST)
Date: Sun, 17 Jun 2001 01:41:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Scott Ashcroft <scott.ashcroft@talk21.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Extra serial port on B160L
Message-ID: <20010617014118.B1263@linuxcare.com>
References: <3B2BD290.E36026D8@talk21.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B2BD290.E36026D8@talk21.com>; from scott.ashcroft@talk21.com on Sat, Jun 16, 2001 at 10:41:36PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 16, 2001 at 10:41:36PM +0100, Scott Ashcroft wrote:
> Just run up a freshly pulled from cvs kernel (2.4.0-pa25) on my B160L
> and an extra serial port appears.
> I take it this is due to the Dino serial port patch which is good but:
> 
> It appears as ttyS0 which means the console suddenly changed to ttyS1
> (making me think things were broken).

Known problem, it will be fixed on Monday.  Caused me much
confusion too.

Thanks for the report,

Richard
