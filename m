Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f202.law14.hotmail.com [64.4.21.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54C9C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Mar 2001 18:38:26 -0700 (MST)
From: "Brian Stewart" <pdksh@hotmail.com>
To: rhirst@linuxcare.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Help with 710 Network Driver
Date: Tue, 27 Mar 2001 01:38:22 
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_37cc_1890_64ea"
Message-ID: <F202TljBOh8s4KWiGtX0000005b@hotmail.com>
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_37cc_1890_64ea
Content-Type: text/plain; format=flowed

I found this in the pmk1.1 micro kernel source for mklinux regarding the 
intel ethernet chip. It appears the chip/system is droping the CX interrupt 
at a very high rate on the 705/710. To correct this the micro kernel driver 
times the last time a CX interrupt was sent I belive. Check it out and maybe 
you can make heads of it Ricahard.

BTW what is a CX interrupt.

Thank You


It is part of the if_596.c ethernet driver code.
_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.

------=_NextPart_000_37cc_1890_64ea
Content-Type: text/plain; name="pc596xmt_bug.txt"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="pc596xmt_bug.txt"


------=_NextPart_000_37cc_1890_64ea--
