Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA04163
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 21:23:53 -0600
Message-Id: <199906120323.XAA29685@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] booting problems
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Fri, 11 Jun 1999 23:23:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, jason@equator.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199906120056.UAA00587@hiauly1.hia.nrc.ca> from "John David Anglin" at Jun 11, 99 08:56:52 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > Okay, this is the same conclusion I came to.  Where should I put both
> > the data and text sengments?
> 
> Try this for the ld options: -Ttext 800 -N -s.

On further inspection of the generated ipl file, it appears that a
more complex script is needed to extract the section data.  Here
is the header dump of IPL created with the above link options:

ipl.N800:     file format elf32-hppa

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00001b90  00000800  00000800  000000a0  2**4
                  CONTENTS, ALLOC, LOAD, CODE
  1 .data         000064a8  00003000  00003000  000028a0  2**12
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          0000115c  0000f950  0000f950  00008d48  2**3
                  ALLOC
  3 .PARISC.unwind 000000c0  00010aac  00010aac  00009a50  2**0
                  CONTENTS
  4 .PARISC.symext 00000000  00010b6c  00010b6c  00009b10  2**2
                  CONTENTS
  5 $CODE$        00000d08  00010ba0  00010ba0  00008d48  2**3
                  CONTENTS, ALLOC, LOAD, CODE

The file offset for the .data section is ok.  However, the .bss
section must be created in the LIF image.  The $CODE$ section
is next in the file and it must be loaded at 10ba0 in the LIF
image.  Finally, the .PARISC.unwind and .PARISC.symext must be
loaded to the correct locations in the LIF image.

It might be possible with a ld script to better arrange the sections
and improve their placement in the linked file.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
