Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailb.telia.com (mailb.telia.com [194.22.194.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id E218E482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Oct 2001 08:20:19 -0600 (MDT)
Date: Sun, 21 Oct 2001 16:19:44 +0200
From: Daniel Engstrom <5116@telia.com>
To: parisc-linux@lists.parisc-linux.org
Cc: Richard Hirst <rhirst@linuxcare.com>,
	JamesBottomley@zaphod.halden.lillfab.se
Message-ID: <20011021161944.G6663@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] New 53c700 driver preformance evaluation
List-ID: <linux-parisc.vger.kernel.org>

Hi,

When I got the new driver running I also did some more bonnie runs with the
following drivers: 
2.4.9-pa32 with the old driver and disconnects disbled
2.4.9-pa61 with the new driver and tagged-queueing disabled
HPUX 10.20

I also did one test with putc and getc changed to the unlocked versions
to see what impact the thread safety had. It was large.

I wonder if the lower speed for block I/O with the new driver is due to the
disabled disconnects?

/Daniel

            --------Sequential Output-------- ---Sequential Input--- --Random--
            -Per Char- --Block--- -Rewrite--- -Per Char- --Block---- --Seeks----
Machine MB K/sec  %CPU K/sec %CPU  K/sec %CPU K/sec %CPU K/sec %CPU  /sec  %CPU
pa32_1 100   313  99.7 3682  68.9  1162  37.5  253  94.9  2545  43.7  75.5  11.9
pa32_2 100   314 100.0 3650  68.3  1175  38.0  252  94.8  2548  43.5  74.1  12.1
pa32_3 100   314 100.0 3641  67.9  1185  38.1  252  94.7  2567  43.2  71.9  12.0

pa61_1 100   314 100.0 2839  51.6   971  32.0  252  95.1  2465  42.5  72.5  11.5
pa61_2 100   313  99.7 2871  53.8   996  33.3  252  94.6  2478  43.0  63.3  10.1
pa61_3 100   313 100.0 2865  52.3   998  32.5  251  94.3  2484  43.2  69.3  11.1

pa61ul 100  1373  97.8 2941  53.7   997  32.4  993  71.1  2444  42.3  67.2  11.4

hpux_1 100   597  98.3 2882  38.4  1530  31.0  405  96.9  3644  41.9  72.8  13.4
hpux_2 100   594  98.4 2930  36.6  1526  28.5  403  96.8  3625  39.3  72.8  13.3
hpux_3 100   599  98.4 2883  37.1  1541  29.9  407  97.2  3646  41.7  72.0  13.1
 

 -- 
