Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20537
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 11:55:55 -0700
Message-Id: <200101151858.KAA10158@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100 
In-reply-to: Your message of "Mon, 15 Jan 2001 11:57:06 PST."
             <Pine.LNX.4.21.0101151144470.23087-100000@maestro.symsys.com>
Date: Mon, 15 Jan 2001 10:58:38 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> > Step 2 says: Use a lifimage (not vmlinux)
> 
> Anybody got one?  

I've placed today's 32-bit on
  puffin.external.hp.com:~ftp/pub/parisc/binaries/lifimages/lifimage-20010115

and the matching vmlinux/System.map under .../binaries/kernels/ .


> What does it take to build a kernel under HP/UX?

I think I was the last person to be doing that as of around Feb 2000.
So it's not clear the tool chain will even properly compile under HPUX.
And CVS build-tools/recipe.hpux is probably broken - recipe.linux is.
Any volunteer to fix recipe.hpux?

AFAIK, the NFSROOT and XC toolchain has only been used under x86-linux.
Try on any other host at your own risk.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
