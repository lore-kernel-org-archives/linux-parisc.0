Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA10587
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 09:14:37 -0600
Message-Id: <199906281452.KAA15264@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] parisc-linux-ld
To: deller@gmx.de (Helge Deller)
Date: Mon, 28 Jun 1999 10:52:21 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <3774EF94.C57237A5@gmx.de> from "Helge Deller" at Jun 26, 99 05:19:48 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> If I would have such an patched linker, I maybe could try make the
> cross-compiled ELF-binary bootable.....

Work has started to rewrite the hppa elf tools (gcc and binutils).
However, Jeff Law has indicated that the relocations done by ld
have a lot of bugs.  He has strongly recommended that the elf tools
not be used until the rewrite is complete.  However, having said
that, it would be useful to develop an ipl that could load an elf
kernel.

With ld, the text origin can be set with "-Ttext address" or using
a loader script (see arch/parisc/hp/vmlinux.lds).  The headers
describing the elf format can be found in binutils/include/elf.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
