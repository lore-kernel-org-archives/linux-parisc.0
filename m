From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: systemd on hppa and number of free RT signals
Date: Wed, 8 Oct 2014 01:12:07 +0300
Message-ID: <20141007221207.GA599@drone.musicnaut.iki.fi>
References: <5434418F.1020407@gmx.de>
 <CAE2sS1jy4sgs7xSev5-NnVqOqb8nUvQVGnc=JZt=tc-1HPdSgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1jy4sgs7xSev5-NnVqOqb8nUvQVGnc=JZt=tc-1HPdSgQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Tue, Oct 07, 2014 at 05:03:30PM -0400, Carlos O'Donell wrote:
> On Tue, Oct 7, 2014 at 3:39 PM, Helge Deller <deller@gmx.de> wrote:
> > What's your opinion on this?
> 
> Flawless hack. Very well reorganized. Your removal of SIGLOST, and
> reorganizing is the best I could come up with also.
> 
> The only thing I will do different is make SIGEMT equal to SIGABRT,
> that way we preserve the semantics of what this operation means. Linux
> doesn't use SIGEMT, but it keeps hppa defining this for use by other
> software that might want similar semantics. You can catch SIGABRT and
> operate on it, so it's one way forward.
> 
> If you agree I'll checkin to glibc master.

BTW, is there any plan/schedule for getting glibc to support pa-risc
without out-of-tree patches? Any help (e.g. testing) needed there?

A.
