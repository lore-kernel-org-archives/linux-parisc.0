Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDD3C4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 02:55:17 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 62512B005; Thu, 15 Feb 2001 09:54:54 +0000 (GMT)
Date: Thu, 15 Feb 2001 09:54:54 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730
Message-ID: <20010215095454.X1374@linuxcare.com>
References: <20010212155919.B7969@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0102130007220.13741-100000@sgate.charlysworld.de> <20010214164925.U1374@linuxcare.com> <01021500595803.07438@P100.helgenet.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01021500595803.07438@P100.helgenet.de>; from deller@gmx.de on Thu, Feb 15, 2001 at 01:01:35AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 15, 2001 at 01:01:35AM +0100, Helge Deller wrote:
> I'm still sure, that this is the correct address to test, but maybe we should 
> just disable the initialisation of bidirectional mode for machines which
> - have an ASP chip, or
> - have their parport-chip at address 0xf0824800 (which is the only region 
> where the ASP has it's parport), or
> - on machines, where "parisc_get_cpu_type(cpu_data[0]) < pcxt_"  (from 
> hardware.h and processor.h) [but I'm not sure if pcxt_ is correct. You'll 
> need to verify]

That parisc_get_cpu_type() bit isn't quite right, how about:

diff -u -r1.7 parport_gsc.c
--- parport_gsc.c       2001/01/25 00:01:32     1.7
+++ parport_gsc.c       2001/02/15 09:42:08
@@ -482,7 +482,7 @@
        /* 
            some older machines with ASP-chip don't support the enhanced parport modes 
        */
-       if (!pdc_add_valid( (void *)(port+4))) {
+       if (boot_cpu_data.cpu_type > pcxt && !pdc_add_valid( (void *)(port+4))) {
            /* Initialize bidirectional-mode (0x10) & data-tranfer-mode #1 (0x20) */
            printk("%s: initialize bidirectional-mode.\n", __FUNCTION__);
            parport_writeb ( (0x10 + 0x20), port + 4);


Works on my 715/75, where boot_cpu_data.cpu_type = 2 = pcxt.

Richard
