From: Roland McGrath <roland@redhat.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Thu, 20 Aug 2009 16:23:57 -0700 (PDT)
Message-ID: <20090820232357.934474730F@magilla.sf.frob.com>
References: <1250805049.4302.121.camel@mulgrave.site>
	<20090820230114.36D3E4E7A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James.Bottomley@HansenPartnership.com (James Bottomley),
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave.anglin@nrc.ca
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: John David Anglin's message of  Thursday, 20 August 2009 19:01:13 -0400 <20090820230114.36D3E4E7A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> At some time, GCC may start a new .text section at the beginning of
> each function.  We do this on hpux but not linux.  This will cause
> multiple .text sections to be present in an object and allow finer grained
> stub placement.

arch/parisc/Makefile:

	# Without this, "ld -r" results in .text sections that are too big
	# (> 0x40000) for branches to reach stubs.
	ifndef CONFIG_FUNCTION_TRACER
	  cflags-y	+= -ffunction-sections
	endif
