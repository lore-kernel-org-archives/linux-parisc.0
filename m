Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA23934
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 07:05:53 -0600
Message-Id: <199906181305.JAA06811@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] A quick update
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 18 Jun 1999 09:05:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3769F3AD.DF068942@thepuffingroup.com> from "Alex deVries" at Jun 18, 99 03:22:21 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

You probably want to use the same link options as Jason used for the IPL:

-N -R address.

The address specified should match the location where the kernel is
loaded into the LIF image.  The -N places the $DATA$ section after
the $CODE$ section in low memory.  The +n option that was being used
in the Makefile has the $DATA$ section in the 0x40000000 quadrant.  
This is wrong for the kernel.

After the kernel is built, take a look at where the sections start
in SOM executable.  Each section must be copied to its corresponding
starting address in the LIF image.  Space must be reserved for the bss
data if there is a section after it that contains necessary data.

Dave

> 
> 
> After an enormous amount of frustration (with fault only to me, I should
> have thought that there was a second bootpserver on my network), the
> kernel tree in CVS actually builds on HPUX.  This is really just Jason's
> work glued into the kernel tree.
> 
> Next:
> 
> - we need an HPUX ld linker script to resolve the vmlinux building,
> what's the format for this?
> 
> - we need to figure out why the bootloader gives an error when loading
> the kernel into memory
> 
> - Alex
> 
> -- 
> Alex deVries
> Vice President of Engineering
> The Puffin Group
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
