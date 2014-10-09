From: Helge Deller <deller@gmx.de>
Subject: Re: systemd on hppa and number of free RT signals
Date: Thu, 09 Oct 2014 22:58:31 +0200
Message-ID: <5436F6F7.3000501@gmx.de>
References: <5434418F.1020407@gmx.de>	<CAE2sS1jy4sgs7xSev5-NnVqOqb8nUvQVGnc=JZt=tc-1HPdSgQ@mail.gmail.com>	<20141009204115.GB4606@drone.musicnaut.iki.fi> <CAE2sS1gZKMncpWGKBqQ44ZQPnWBsG0H-XfNaghCRUe6OwQ2ujg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
To: Carlos O'Donell <carlos@systemhalted.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1gZKMncpWGKBqQ44ZQPnWBsG0H-XfNaghCRUe6OwQ2ujg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Aaro & Carlos,

On 10/09/2014 10:48 PM, Carlos O'Donell wrote:
> On Thu, Oct 9, 2014 at 4:41 PM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>> #if defined(SIGEMT) && (!defined(SIGXCPU) || (SIGEMT != SIGXCPU))
>>      case SIGEMT: return "SIGEMT";
>> #endif

Aaro, thanks a lot for testing !!!

> I withdraw my suggestion to make SIGEMT equal to SIGABRT. Just remove
> it. It's not needed on Linux and just causes problems.
>
> In this case it conflicts with SIGABRT in the case statement. Better
> to just remove it.

Yes, I agree.

Helge

