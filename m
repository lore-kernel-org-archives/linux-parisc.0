Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA12755
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Aug 2000 15:22:45 -0600
Date: Thu, 17 Aug 2000 08:23:08 -0700
From: "H . J . Lu" <hjl@lucon.org>
To: Alan Modra <alan@linuxcare.com.au>
Cc: libc-alpha@sources.redhat.com, parisc-linux@thepuffingroup.com,
        parisc@lists.linuxcare.com
Subject: Re: hppa glibc ld -r
Message-ID: <20000817082308.B20071@lucon.org>
References: <Pine.LNX.4.21.0008171700460.28670-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0008171700460.28670-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Aug 17, 2000 at 05:59:48PM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 17, 2000 at 05:59:48PM +1000, Alan Modra wrote:
> 
> -ffunction-sections isn't a complete solution though.  If two source files
> declare a local function of the same name, "setup", for instance, then
> both files will have a section called ".text.setup".  These two sections
> will be merged during the "ld -r", which has the unfortunate effect of

Can you teach ld not to merge ".text.xxxxx" with -r under HPPA?

> moving a local function to a location a long way off from where it's
> called.  That's bad, firstly because it means we now need a stub to reach
> the function, but more importantly the stubs are not PIC and thus need
> relocation information when creating shared libraries.  In particular, for
> reasons too complicated to explain here, I don't want to create stubs for
> local functions;  It would mean emitting relocs for every *potential*
> stub.
> 
> Anybody know why glibc uses "ld -r", and if there is a good reason why
> we can't just remove the "ld -r"?

I don't think it has to be used. --whole-archive will do the same
trick. But "ld -r" is more convenient. With --whole-archive, you may
have to put -Wl,--whole-archive/-Wl,--no-whole-archive around each file
generarted with "ld -r"


H.J.
