From: Timur Tabi <b04825@freescale.com>
Subject: Re: Build regressions/improvements in v3.4-rc7
Date: Thu, 17 May 2012 13:51:46 -0500
Message-ID: <4FB548C2.3070405@freescale.com>
References: <1337157034-22773-1-git-send-email-geert@linux-m68k.org> <CAMuHMdUtL4_mv-e-EQAZmNcb9dAT=PXB59i7Vuj2vf8NnaBFzQ@mail.gmail.com> <1337212281.30558.17.camel@pasglop> <4FB535D3.7000106@freescale.com> <CAOZdJXW2jmFG8hkBRMAsO-CJ3ruMd28LqS0b-BGZTU7FnpRi3Q@mail.gmail.com> <CAMuHMdVszy2sk6f045krqr=PPQFnd-GrtJYJMQCCPzkq-65psg@mail.gmail.com> <4FB546FB.807@freescale.com> <4FB547F9.7000804@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linuxppc-dev <linuxppc-dev@ozlabs.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Wood Scott-B07421 <B07421@freescale.com>,
	Kumar Gala <galak@kernel.crashing.org>
To: Scott Wood <scottwood@freescale.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB547F9.7000804@freescale.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Scott Wood wrote:
> Regardless of the config that shows this, the MSR[GS] check should go
> away.  If you have a /hypervisor node, you already know you're a guest.

Fair enough.

-- 
Timur Tabi
Linux kernel developer at Freescale

