Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA23391
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 08:51:42 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Oct 2000 14:52:48 -0000
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Bdale Garbee <bdale@gag.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ntpd fails on mlockall()
References: <20001010025700.26519359E7@rover.gag.com>
	<20001010215315.J9399@linuxcare.com> <8766n0ynjw.fsf@rover.gag.com>
	<20001011130957.N9399@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Oct 2000 10:47:40 -0400
In-Reply-To: Richard Hirst's message of "Wed, 11 Oct 2000 13:09:57 +0100"
Message-ID: <87wvffcu43.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst <rhirst@linuxcare.com> writes:

> timer_create() is in librt.a - anyone know whether we expect this to
> work or not atm?

librt.so you mean, and it may not actually work, because it pulls in
libpthread.so.  I did enough fixing of linuxthreads such that merely
linking with -lpthread doesn't break your program, but I expect there
might be other problems, and actually using threads almost certainly
will not work.  (we're still missing a few #defines in pt-machine.h,
which I'll put in today, maybe, but there are probably VM issues in
the kernel as well, and I don't know if clone(2) actually works).

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
