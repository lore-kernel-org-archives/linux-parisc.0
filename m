Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA09405
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 10:45:05 -0600
Message-Id: <199906011644.MAA25119@hiauly1.hia.nrc.ca>
Subject: Re: Building the Bootloader
To: cjbeard@istar.ca (Christopher Beard)
Date: Tue, 1 Jun 1999 12:44:46 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.9906011146400.24972-100000@centauri.osfi-bsif.gc.ca> from "Christopher Beard" at Jun 1, 99 11:58:57 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > Hm.  Okay then.  So what we need to do is fix the cross compiling of
> > mkipl.  I'll have a look at this.
>           
> There is some confusion here. The IPL does not have to be SOM, in fact, it
> wouldn't work correctly if it was. It's a raw binary format created using
> HP's linker by passing parameters to give it a zero offset, etc. (And
> which Jason Eckardt suggests could also be extracted from a valid ELF
> format binary given the right script.)

If the IPL could be extracted from an ELF binary, then it could be produced
on any system which supports cross compiling to HP/UX ELF format.

There also seems to be some confusion about the kernel and its format.
In order to debug it, it needs to be either an ELF or SOM binary with
symbol tables, .stabs info, etc.  Although I haven't looked at the
IPL, I would guess that it is designed to load an ELF binary.  There
are also file system issues.

> The confusion exists as currently, it can only be produced under HP/UX as
> there are still some issues with the xcompiler/binutils under x86 for the
> PA-RISC target. 
> 
> I haven't looked at this very closely, but when I attempted to generate a
> raw binary of the bootloader code with the xcompiler/binutils it either
> segfaulted or generated a 4 GB sparse file. There was a double free within
> binutils which was fixed, and some minor version mismatches, but still, it
> does not generate a working binary.

Obviously, the bootloader will be a pain to debug.  I think that I have
a working cross compiler running under hpux to produce ELF object files
and binaries.  I had a problem with ld which went away when I rebuilt
binutils with no optimization (-O0).

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
