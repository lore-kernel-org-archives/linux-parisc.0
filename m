Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA09958
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Sep 2000 12:27:43 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 29 Sep 2000 18:28:28 -0000
Received: from dhd by tarwebok with local (Exim 3.12 #1 (Debian))
	id 13f4tl-00018U-00
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Sep 2000 14:28:41 -0400
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] floating point exception error
References: <20000927195500.57241381CD@carmen.fc.hp.com>
	<873dilo9dp.fsf@tarwebok.i-did-not-set--mail-host-address--so-shoot-me>
	<87snqk1q2o.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 29 Sep 2000 14:28:40 -0400
In-Reply-To: David Huggins-Daines's message of "28 Sep 2000 11:41:51 -0400"
Message-ID: <87hf6znjc7.fsf@ottawa.linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> So it looks like we are either not managing to set up %fr0 properly on
> process startup or we are mangling it in the kernel or libc somewhere
> along the way.  I'll investigate further today.

GAR!  So the problem is obvious.  Not only is GCC emitting the wrong
comparison condition (<> vs. !=), but log(-8.0) is returning a
signalling NaN on GNU/Linux, and a quiet one on HP/UX:

avalanche:~# ./fptest3
foo.l is 7fffffffffffffff
!!die_if_kernel: fptest3(154): Floating point exception 14
(etc...)

bash-2.03$ ./fptest3
foo.l = 7ff4000000000000

Time for the self-LART again I guess :)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
