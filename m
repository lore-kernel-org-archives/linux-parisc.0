Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA24127
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 08:58:30 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Oct 2000 14:59:21 -0000
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] __hp9000s700 predefined
References: <200010110704.AAA05911@milano.cup.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Oct 2000 10:44:31 -0400
In-Reply-To: Grant Grundler's message of "Wed, 11 Oct 2000 00:04:01 -0700 (PDT)"
Message-ID: <871yxne8ts.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@cup.hp.com> writes:

> John Marvin suggested we remove the __hp9000s700 from the pa-linux
> config files since it's HPUX crud. I think he's right since parisc-linux
> kernels are intended to run on both 700's and 800's.
> parisc-linux configs functionality in/out based on CONFIG_XXX flags
> or run-time checks (ie register_driver()).
> Can we remove the "-D__hp9000s700" from gcc/gcc/config/pa/pa-linux.h?

Yes

> Similarly, gcc/gcc/config/pa/pa-linux64.h has "-D__hp9000s800"
> which could/should be removed at the same time.

Yes

It's true, those defines are only there for compatibility with broken
HP/UX source.  I left them in because I figured it wouldn't break
anything.  If they really offend people I can certainly remove them :)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
