From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] fix unwind crash - was: Re: 2.6.26 kernel crash
Date: Fri, 8 Aug 2008 08:56:46 -0400
Message-ID: <119aab440808080556m3d0a7484r83b78fa8b2d08ec0@mail.gmail.com>
References: <200807201846.11809.deller@gmx.de>
	 <200807201907.59762.deller@gmx.de> <488F7E32.4070204@gmx.de>
	 <1e3eba760808030726l93f60dftdcec0c487933129b@mail.gmail.com>
	 <20080806194125.GA3281@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Randolph Chung" <randolph@tausq.org>,
	"Helge Deller" <deller@gmx.de>, linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080806194125.GA3281@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 6, 2008 at 3:41 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> -       parisc_show_stack(current, NULL, regs);
> +       if (!user)
> +               parisc_show_stack(current, NULL, regs);

or

if (level == KERN_CRIT)
  parisc_show_stack (current, NULL, regs);

I think this bit of code is the only thing that is required e.g. Only
call parisc_show_stack if it's not a usermode set of registers?

Cheers,
Carlos.
