Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA23948
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 06:21:02 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by atlrel1.hp.com (Postfix) with SMTP id E152D3C2D
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 08:21:19 -0400 (EDT)
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 25 May 2000 12:14:11 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA24140;
	Thu, 25 May 2000 22:12:14 +1000
Date: Thu, 25 May 2000 22:12:14 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bad asm comments
In-Reply-To: <Pine.LNX.4.21.0005241750310.8974-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0005252205560.2241-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

And yet some more glibc files need patching

configure.in
config.h.in
configure
include/libc-symbols.h 
sysdeps/unix/sysv/linux/hppa/sysdep.h

The configury changes are so we can get the line separator and comment
char right for include/libc-symbols.h, which uses multiple assembler
instructions per cpp macro.  I can see why there was a strong desire to
use `;' as the line separator...

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
