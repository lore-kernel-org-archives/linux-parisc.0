Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 629094837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 11:12:09 -0600 (MDT)
Date: Thu, 17 Jul 2003 19:12:03 +0200
Message-ID: <3F0BEA830000215A@ocpmta1.freegates.net>
In-Reply-To: <20030717155203.GO30257@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
To: "Randolph Chung" <tausq@debian.org>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org,
	"Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hello Randolph,
>> 
>> > Freeing unused kernel memory: 508k freed
>> Adding 250872k swap on /dev/sda2.  Priority:-1 extents:1
>> 
>> Here it hangs. (just in case, i tried a telnet but no success)
>> 
>> I so do a toc.
>> 
>> Unfortunately the IAOQ = 0x00000000000172b8  is no
>>  a relevant value?
>
>looks like a userspace address....
>
>can you boot the kernel with init=/bin/sh and see what happens?

Well here it hangs at "Freeing unused kernel memory: 508k freed" but do not
mount anything else (still clean when rebooted with 2.4)

> can you
>disable your swap partition (comment it out of /etc/fstab) and see what
>happens?

Same results (even if I used the 2 tips together and even with -s for su
mode)

[and always the same IAOQ after TOC]

mm would it help if tomorrow I re-compile it in 64bits and disable CONFIG_KALLSYMS?

Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
