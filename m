Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA10571
	for <parisc-linux@puffin.external.hp.com>; Sun, 13 Jun 1999 13:11:01 -0600
Message-Id: <199906131910.PAA06530@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] booting problems
To: law@cygnus.com
Date: Sun, 13 Jun 1999 15:10:57 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <22030.929169143@upchuck.cygnus.com> from "Jeffrey A Law" at Jun 12, 99 00:32:23 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Anyway I think you may be able to fix this bug by changing the subseg_force_new
> call to look something like:
> 
>   subseg_force_new (alias ? alias : ss_name, 0);

Just to through a little "gas" on the discussion, I installed Jeff's
patch and rebuilt.  The patch sucessfully merges $CODE$ into .text.

Here are the kernel headers:

vmlinux:     file format elf32-hppa

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         000759b0  00008000  00008000  00001000  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         0000f260  0007d9b0  0007d9b0  000769b0  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          0001ac6c  0008e000  0008e000  00086000  2**4
                  ALLOC
  3 .PARISC.unwind 00006be0  000a8c6c  000a8c6c  00086000  2**0
                  CONTENTS
  4 .PARISC.symext 00000000  000af84c  000af84c  0008cbe0  2**2
                  CONTENTS

Here are the headers for ipl linked with "-Ttext800 -N":

ipl:     file format elf32-hppa

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         000028a0  00000800  00000800  00000080  2**4
                  CONTENTS, ALLOC, LOAD, CODE
  1 .data         000064a8  00004000  00004000  00003880  2**12
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          0000115c  00010950  00010950  00009d28  2**3
                  ALLOC
  3 .PARISC.unwind 000000c0  00011aac  00011aac  00009d28  2**0
                  CONTENTS
  4 .PARISC.symext 00000000  00011b6c  00011b6c  00009de8  2**2
                  CONTENTS

I think that we are real close to being able to generate a bootable
kernel with the existing elf32 tools.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
