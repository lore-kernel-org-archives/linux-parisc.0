Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA12467
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 16:04:12 -0600
To: Paul Bame <bame@endor.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building a glibc-based tool chain
References: <E12ftBw-0003b1-00@endor.fc.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 14 Apr 2000 17:48:22 -0400
Message-ID: <87zoqwmk0p.fsf@tarwebok.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame <bame@endor.fc.hp.com> writes:

> Ok, using my prior instructions you'll get a 'glibc' containing
> x86 object files!  crt1.o is one of those, and is probably why the
> linker segfaults.

Yup, it wouldn't surprise me, since the Alpha linker also does this
when you try to link i386 object files with it.  Go binutils go!

(BTW: if you're using the aboot ISO9660 code for PALO, be forewarned
that there are some bad bugs in it that I've recently fixed - 0.7pre3
has the updates)

-- 
David Huggins-Daines, Senior Linux Consultant, Linuxcare, Inc.
613.562.1239 desk, 613.223.0225 mobile
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
