Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA21790
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 12:48:06 -0700
Received: from tipas.lt (i195.sintegra.lt [193.219.1.195]) by server.tipas.lt (8.6.11/cyxob-1.7) with ESMTP id VAA15785 for <parisc-linux@thepuffingroup.com>; Mon, 15 Jan 2001 21:49:07 -2200
Message-ID: <3A636BE1.EE2DBF87@tipas.lt>
Date: Mon, 15 Jan 2001 22:30:09 +0100
From: Aleksandr Konstantinov <sanjak@tipas.lt>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> Anybody got one?

Yes. Want one ?

>> o HPUX is required to build a lifimage (XC and native builds work on
occasion)
>> o mongoose (HPUX) boot loader is an option (PALO required)
>> o Serial console required (can use STI now)

Can anybody explain me how to get console NOT on serial link ?

>> o mkp is working on superio ;^)


> I don't have an environment to build my own kernel image yet.
Obviously I
> can't do a native build.  And I've got almost a week of HP/UX
experience
> now.  :)  What does it take to build a kernel under HP/UX?  I'm
guessing
> GCC+Binutils+Make as a minimum.  What are my chances with the
> cross-compiler?

I used xc tools from palinux-0.5 on x86 linux (Slackware 3.6 + glibc).
Kernel was built satisfactory (despite a lot of warnings about
incompatible
argument types (as far as i remember)). Booting went ok.



A.K.
