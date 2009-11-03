From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Tue, 3 Nov 2009 16:36:02 -0500 (EST)
Message-ID: <20091103213603.9576D4FB2@hiauly1.hia.nrc.ca>
References: <4AF09C4D.5030600@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AF09C4D.5030600@gmx.de> from "Helge Deller" at Nov 3, 2009 10:10:37 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Unwind section '.PARISC.unwind' at offset 0x11c contains 3 entries:
> 
> <libcrc32c_mod_fini>: [0x0-0x2c]
>          Entry_GR=1 Save_SP Save_RP Total_frame_size=8
> <libcrc32c_mod_init>: [0x0-0x44]
>          Entry_GR=1 Save_SP Save_RP Total_frame_size=8
> <crc32c>: [0x0-0x6c]
>          Entry_GR=2 Save_SP Save_RP Total_frame_size=8

What do you see for '.rela.PARISC.unwind'?

I suspect that this is a problem in handling the R_PARISC_SEGREL32
relocations is the kernel loader.  The above would be fine if
libcrc32c_mod_fini and libcRc32c_mod_init are in different sections
(.exit.text and .inti.text).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
