From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: systemd on hppa and number of free RT signals
Date: Thu, 9 Oct 2014 16:48:03 -0400
Message-ID: <CAE2sS1gZKMncpWGKBqQ44ZQPnWBsG0H-XfNaghCRUe6OwQ2ujg@mail.gmail.com>
References: <5434418F.1020407@gmx.de>
	<CAE2sS1jy4sgs7xSev5-NnVqOqb8nUvQVGnc=JZt=tc-1HPdSgQ@mail.gmail.com>
	<20141009204115.GB4606@drone.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20141009204115.GB4606@drone.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 9, 2014 at 4:41 PM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> #if defined(SIGEMT) && (!defined(SIGXCPU) || (SIGEMT != SIGXCPU))
>     case SIGEMT: return "SIGEMT";
> #endif

Helge,

I withdraw my suggestion to make SIGEMT equal to SIGABRT. Just remove
it. It's not needed on Linux and just causes problems.

In this case it conflicts with SIGABRT in the case statement. Better
to just remove it.

Cheers,
Carlos.
