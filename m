From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: systemd on hppa and number of free RT signals
Date: Thu, 9 Oct 2014 23:41:15 +0300
Message-ID: <20141009204115.GB4606@drone.musicnaut.iki.fi>
References: <5434418F.1020407@gmx.de>
 <CAE2sS1jy4sgs7xSev5-NnVqOqb8nUvQVGnc=JZt=tc-1HPdSgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
To: Carlos O'Donell <carlos@systemhalted.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1jy4sgs7xSev5-NnVqOqb8nUvQVGnc=JZt=tc-1HPdSgQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Tue, Oct 07, 2014 at 05:03:30PM -0400, Carlos O'Donell wrote:
> The only thing I will do different is make SIGEMT equal to SIGABRT,
> that way we preserve the semantics of what this operation means. Linux
> doesn't use SIGEMT, but it keeps hppa defining this for use by other
> software that might want similar semantics. You can catch SIGABRT and
> operate on it, so it's one way forward.

I tested Helge's SIGNAL_NEW patches by recompiling my small distro
(~100 packages) and only Tcl 8.6 complation breaks (duplicate case
value in tclPosixStr.c / Tcl_SignalMsg).

The current check they have is:

#if defined(SIGEMT) && (!defined(SIGXCPU) || (SIGEMT != SIGXCPU))
    case SIGEMT: return "SIGEMT";
#endif

A.
