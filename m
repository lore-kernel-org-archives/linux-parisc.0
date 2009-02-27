From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: can't compile kernel for parisc
Date: Fri, 27 Feb 2009 10:56:13 -0500
Message-ID: <119aab440902270756w4cceb56bq4c247d70e3e34786@mail.gmail.com>
References: <a4423d670902270247g70134a05n20fe3ba7c8970fbe@mail.gmail.com>
	 <119aab440902270424oaafbc7ehcc23b433e8ae06e5@mail.gmail.com>
	 <a4423d670902270504w6386cffdp91249e962dfa3fa4@mail.gmail.com>
	 <119aab440902270518t2cc34c13x4991fb394d54f774@mail.gmail.com>
	 <a4423d670902270740y2c376722j2c2b444401bdc271@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670902270740y2c376722j2c2b444401bdc271@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 27, 2009 at 10:40 AM, Alexander Beregalov
<a.beregalov@gmail.com> wrote:
> The same problem: ld segfaults:
> do_page_fault() pid=15739 command='ld' type=15 address=0x00000c84

This is likely a bug in the static linker, or a miscompilation of the
static linker by your toolchain.

What were the binutils testsuite results for this static linker?

Cheers,
Carlos.
