Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA30605
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 23:47:50 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 17C476A2
	for <parisc-linux@puffin.external.hp.com>; Wed,  6 Dec 2000 22:50:29 -0800 (PST)
Message-Id: <200012070649.WAA07510@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com, debian-hppa@lists.debian.org
Subject: Re: A500 status update 
In-reply-to: Your message of "Wed, 06 Dec 2000 22:34:55 PST."
             <200012070634.WAA07459@milano.cup.hp.com>
Date: Wed, 06 Dec 2000 22:49:49 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> TODO:

I forgot to mention:
o sleep seg faults (syscall issue?)
o syslogd seg faults (ditto?)
o CONFIG_GENRTC=n since hwclock crashes the system at that point
o have bogus /sbin/modprobe (shell script that echo's the parms)

Anything else I'm forgetting?

grant
