From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [RFC] pthread/signal problems on hppa (ruby1.9 problems)
Date: Fri, 13 Feb 2009 11:35:16 -0500
Message-ID: <20090213163516.GB4559@bombadil.infradead.org>
References: <4994C239.8010009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dann frazier <dannf@dannf.org>,
	Lucas Nussbaum <lucas@lucas-nussbaum.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4994C239.8010009@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 13, 2009 at 01:43:37AM +0100, Helge Deller wrote:
> child_stack=0x804b904, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM) = 30263

> and here with hppa:
> child_stack=0x804b904, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_SYSVSEM) = 30272

Somewhat preturbed by this. This appears to be the flags set by the
respective nptl and linuxthreads code paths. I thought Dann Frazier
said that NPTL hadn't helped? Perhaps we still have bugs in our NPTL
code... :/

(See CLONE_SIGNAL in nptl/$mumble.c, versus the annotate of the file
 you've patched in linuxthreads...)

Would be curious to see what happens on linuxthreads-i386...
