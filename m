Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA12295
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 21:40:21 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Sep 2000 03:40:46 -0000
To: Cary Coutant <cary@cup.hp.com>
Cc: <parisc-linux@thepuffingroup.com>, "Alan Modra" <alan@linuxcare.com.au>
Subject: Re: [parisc-linux] userspace function pointers in the kernel
References: <200009130105.SAA19154@adlmail.cup.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Sep 2000 23:27:18 -0400
In-Reply-To: Cary Coutant's message of "Tue, 12 Sep 2000 18:05:38 -0700"
Message-ID: <87its1km3t.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant <cary@cup.hp.com> writes:

> I can't say for sure how Linux/IA-64 uses the .opd section, but the 
> runtime and the psABI recommend that the "official" function descriptors 
> be created by the dynamic loader as needed in response to dynamic FPTR 
> relocations.

Ah, okay, that makes sense.  This is what Linux/IA-64 does - dynamic
FPTR relocations result in OFDs being created dynamically (always, for
both local and global symbols).  And yes, the code in GNU libc does
ensure that they are mapped one-to-one with symbols in each process.

As mentioned earlier we have been trying to decide whether to do this
on PA-RISC as well.  Originally I threw it in so that (you guessed it)
comparisons of function pointers with NULL would work properly :-)

But as Alan says, it looks like we need it for other reasons as well.

> One way of avoiding the dynamic allocation by the dynamic loader is for 
> the linker to allocate OFDs statically for each exported function, and 
> for each hidden or static function whose address is taken.

Hm.  I'm not nearly as familiar with the linker code as I am with the
dynamic linker code, so I'm not sure what it does.  But, as noted
above, GNU libc does dynamic allocation, so it's probably not relevant.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
