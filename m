Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B4814A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Mar 2001 13:33:45 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A71F7B007; Mon,  5 Mar 2001 20:34:04 +0000 (GMT)
Date: Mon, 5 Mar 2001 20:34:04 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sym53c8xx driver with 64-bit kernel on C200.
Message-ID: <20010305203404.K6030@linuxcare.com>
References: <3AA1BA3F.A7C79E31@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AA1BA3F.A7C79E31@uswest.net>; from rbradetich@uswest.net on Sat, Mar 03, 2001 at 08:45:03PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 03, 2001 at 08:45:03PM -0700, Ryan Bradetich wrote:
>  OUTL (nc_dsp, pc);         <-- This line of code causes the HPMC

That line triggers the 53c8xx to start fetching and
executing scripts from memory.

> The sim700 HPMC is caused by the following line of code in the
> sim700_init_host function.
> 
> #if 1
>     NCR_write32(DSP_REG, TARGDATA(HOST_ID)->ba->script+Ent_test1/4+3);
> <-- This line of code causes the HPMC

That line triggers the 53c7xx to start fetching and
executing scripts from memory.


Richard
