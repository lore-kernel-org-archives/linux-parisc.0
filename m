From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Thu, 20 Aug 2009 20:03:04 -0400 (EDT)
Message-ID: <20090821000304.AEDE64E09@hiauly1.hia.nrc.ca>
References: <20090820232357.934474730F@magilla.sf.frob.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave.anglin@nrc.ca
To: roland@redhat.com (Roland McGrath)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090820232357.934474730F@magilla.sf.frob.com> from "Roland McGrath" at Aug 20, 2009 04:23:57 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> arch/parisc/Makefile:
> 
> 	# Without this, "ld -r" results in .text sections that are too big
> 	# (> 0x40000) for branches to reach stubs.
> 	ifndef CONFIG_FUNCTION_TRACER
> 	  cflags-y	+= -ffunction-sections
> 	endif

Thus, the .text.* sections must be coming from .S files, or possibly
from dwarf2 debug output.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
