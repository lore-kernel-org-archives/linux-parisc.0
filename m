Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA25040
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 11:57:48 -0600
Message-Id: <199906181749.NAA08049@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] A quick update
To: cary@cup.hp.com (Cary Coutant)
Date: Fri, 18 Jun 1999 13:49:14 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199906181656.JAA12339@cllmail.cup.hp.com> from "Cary Coutant" at Jun 18, 99 09:58:18 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> >The -N places the $DATA$ section after
> >the $CODE$ section in low memory.  The +n option that was being used
> >in the Makefile has the $DATA$ section in the 0x40000000 quadrant.  
> >This is wrong for the kernel.
> 
> The opposite of -N is -n, not +n. The +n option tells the linker to 
> search archive libraries iteratively, which I believe is needed for the 
> Linux kernel.

Thanks for the information on the +n option.  My old system doesn't
document +n.  However, with the simple configuration that is being
tested, it doesn't seem necessary to link the kernel with +n.  Possibly,
+n will be required when more modules are configured in the kernel.

> The -N option tells the linker to build a "non-shareable" executable, so 
> it puts text and data together in one segment. The -n option is the 
> default, where shareable text is placed in the first quadrant and data is 
> placed in the second quadrant.

Based on the code in the IPL that is being used, it looks like -N
is the correct choice.  The IPL doesn't try to load kernel data
into the second quadrant as far as I can tell.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
