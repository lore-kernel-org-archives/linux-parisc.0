From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] fix unwind crash - was: Re: 2.6.26 kernel crash
Date: Wed, 6 Aug 2008 21:48:23 -0400
Message-ID: <119aab440808061848o21cae9aew82b949067bdec4df@mail.gmail.com>
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
> +       user = !!user_mode(regs);

Exqueeze me? Baking powder? Why can't the compiler just mush all of
this up and get back the same thing you had before?

Cheers,
Carlos.
