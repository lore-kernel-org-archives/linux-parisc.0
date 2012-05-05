From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sat, 5 May 2012 10:09:53 -0700
Message-ID: <CA+55aFxSJbcigdqwoyKQTOV3MDtgcMyDqXtKz3JuJC_SD9v2vw@mail.gmail.com>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com> <1798237.g4OIBKAx4s@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1798237.g4OIBKAx4s@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, May 4, 2012 at 11:55 PM, Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
>
> I did only move the definition of PAGE0 from asm/pdc.h to asm/page.h and fixed
> another bunch of breakage that was detected while fixing this.

I have to say that that sounds like a more natural patch. *Every*
other architecture defines cpu_relax() in <asm/processor.h>, so it
sounds like a bad idea to make PA-RISC any more different than
necessary.

Even if only one or two people actually care.

                     Linus
