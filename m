From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [RFC] pthread/signal problems on hppa (ruby1.9 problems)
Date: Fri, 13 Feb 2009 18:31:23 -0500
Message-ID: <119aab440902131531t54d759e6lb17b1aaedb7b5986@mail.gmail.com>
References: <4994C239.8010009@gmx.de>
	 <20090213163516.GB4559@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dann frazier <dannf@dannf.org>,
	Lucas Nussbaum <lucas@lucas-nussbaum.net>
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090213163516.GB4559@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 13, 2009 at 11:35 AM, Kyle McMartin <kyle@infradead.org> wrote:
> On Fri, Feb 13, 2009 at 01:43:37AM +0100, Helge Deller wrote:
>> child_stack=0x804b904, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM) = 30263
>
>> and here with hppa:
>> child_stack=0x804b904, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_SYSVSEM) = 30272

CLONE_THREAD informs the kernel of the *type* of POSIX signal
semantics to apply.

In glibc CLONE_SIGNAL expands to CLONE_SIGHAND | CLONE_THREAD, so
watch out for that when reading the code.

Unfortunately linuxthreads can't cope with CLONE_THREAD being enabled.
For example if you enable CLONE_THREAD then getpid() in those threads
will no
longer return a unique value per thread, but the thread group ID.

> Somewhat preturbed by this. This appears to be the flags set by the
> respective nptl and linuxthreads code paths. I thought Dann Frazier
> said that NPTL hadn't helped? Perhaps we still have bugs in our NPTL
> code... :/

CLONE_THREAD is always on in NPTL. I know of no targets that override
ARCH_CLONE in glibc to remove CLONE_THREAD from the flag list.

That is not to say that the bug might be different in NPTL.

> (See CLONE_SIGNAL in nptl/$mumble.c, versus the annotate of the file
>  you've patched in linuxthreads...)
>
> Would be curious to see what happens on linuxthreads-i386...

I would bet that it also locks up.

Cheers,
Carlos.
