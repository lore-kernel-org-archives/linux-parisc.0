Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA23609
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Sep 2000 09:41:14 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 28 Sep 2000 15:42:03 -0000
Received: from dhd by tarwebok with local (Exim 3.12 #1 (Debian))
	id 13efom-0000GE-00
	for <parisc-linux@thepuffingroup.com>; Thu, 28 Sep 2000 11:41:52 -0400
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] floating point exception error
References: <20000927195500.57241381CD@carmen.fc.hp.com>
	<873dilo9dp.fsf@tarwebok.i-did-not-set--mail-host-address--so-shoot-me>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 28 Sep 2000 11:41:51 -0400
In-Reply-To: David Huggins-Daines's message of "27 Sep 2000 16:41:38 -0400"
Message-ID: <87snqk1q2o.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> We probably need more complicated FPU trap logic in the kernel in
> order to deliver exceptions in the proper POSIX and IEEE manner.

Yes, I'm handwaving.  Of course POSIX says nothing about this, and I
don't exactly know what IEEE says about delivery of exceptions (just
that certain exception flags need to exist).

The FPU support that I've put in glibc is specified by ANSI C99 (not
C89 as far as I can tell), and is found in <fenv.h>

A cursory comparison of this header file on GNU libc 2.1.92 vs. HP/UX
11 reveals that HP/UX implements the same functions, except for
feenableexcept() which does not exist on HP/UX.  The definition of
fenv_t is different from what I expected in that it does not include
the exception status registers (LSW of %fr0, %fr1-%fr3), only the
status word (MSW of %fr0).  Also, I notice that the FE_* macros refer
to the flag bits rather than the enable bits in the floating point
status word, and are different in wide mode (!).

> I would appreciate it if someone from HP could comment on this -
> how does HP/UX handle this?

Just for the record, this is what the mawk configure test reports on
HP/UX 11:

checking handling of floating point exceptions
        division by zero does not generate an exception
        overflow does not generate an exception
        math library supports ieee754

Which is the same as reported by Linux/i386.

Linux/alpha without -mieee reports:

checking handling of floating point exceptions
	division by zero generates an exception
	overflow does not generate an exception
(and then some warnings at the end)

Whereas with -mieee we get the same results as HP/UX 11 and
Linux/i386.

So it looks like we are either not managing to set up %fr0 properly on
process startup or we are mangling it in the kernel or libc somewhere
along the way.  I'll investigate further today.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
