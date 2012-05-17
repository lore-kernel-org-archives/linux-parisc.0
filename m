From: Timur Tabi <timur@freescale.com>
Subject: Re: Re: Build regressions/improvements in v3.4-rc7
Date: Thu, 17 May 2012 12:30:59 -0500
Message-ID: <4FB535D3.7000106@freescale.com>
References: <1337157034-22773-1-git-send-email-geert@linux-m68k.org>  <CAMuHMdUtL4_mv-e-EQAZmNcb9dAT=PXB59i7Vuj2vf8NnaBFzQ@mail.gmail.com> <1337212281.30558.17.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	<linux-kernel@vger.kernel.org>,
	Linuxppc-dev <linuxppc-dev@ozlabs.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Scott Wood <scottwood@freescale.com>,
	Kumar Gala <galak@kernel.crashing.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337212281.30558.17.camel@pasglop>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Benjamin Herrenschmidt wrote:
> Thanks. These are all freescale platforms, the relevant people should be
> already but I've added Scott and Kumar to the CC list just in case.

Seeing how this is my code, I'd say the relevant people were not CC'd. :-)

Anyway, I think I see what the problem is, but it does appear when I use
the normal defconfigs.  What .config was being used?

-- 
Timur Tabi
Linux kernel developer at Freescale

