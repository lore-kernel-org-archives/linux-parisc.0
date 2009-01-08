From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: blink loadavg LEDs on Oops
Date: Fri, 09 Jan 2009 00:03:49 +0100
Message-ID: <49668655.2010504@gmx.de>
References: <49635B41.5060205@gmx.de>	 <7d01f9f00901060728w2001ed38v15c305d1472cb66@mail.gmail.com>	 <49637B5E.7010103@gmx.de> <7d01f9f00901070338m4da2f915m707df8588a134dca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Thibaut VARENE <varenet@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00901070338m4da2f915m707df8588a134dca@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thibaut VARENE wrote:
> On Tue, Jan 6, 2009 at 4:40 PM, Helge Deller <deller@gmx.de> wrote:
> 
>> Yeah, valid question.
> ....
>> So, whenever the kernel hits such a WARNING(), all LEDs will blink.
>> Now after my patch, the 4 LEDs on the left side blink (they are currently
>> not used anyway), while Heartbeat, disk-IO and LAN in/out still work
>> as usual. So, you will notice the 4 LEDs at once as well, but in addition
>> you still have the possibility to see if LAN goes in/out (e.g. if you ping
>> the machine) or if the heartbeat still works (and so your machine should
>> still be reachable).
> 
> The thing is that you have a machine with more than 4 LEDs. I have
> B180/B132s which have only 4 leds. Thus I won't notice anything when
> an Oops occurs. If you really don't want to have the old behaviour
> (which, again, I really found nice), how about having the heartbeat
> LED fixed when an oops occurs.
> 
> Even better, a way to "reset" the state of the leds through /proc
> would solve both problems: an oops occurs, all/some leds flash/remain
> lit, you (try to) login, figure out the oops wasn't so serious, echo
> something > /proc/pdc/led and the LEDs start blinking normally again.
> 
> Anyway, the key point here is that not all machines without LCD have
> more than 4 LEDs ;)

I think you are right. My b160L has 4 LEDs only as well.
So, just changing the "upper" 4 LEDs is the wrong way.
Then I was thinking to just check for the machine type or processor type
and make it dependend on that. No good idea either.

In the end, I think it's the fault of CONFIG_DEBUG_SPINLOCK.
If this is enabled, it just turns sets oops_in_progress=1 as soon as
a spinlock was wrong. Either way, if this happens something is
wrong, and the LEDs should flash.
That said, I think we should just drop my patch. If they all flash
as soon as an error happened this is just right.
In a normal productive system a bad spinlock shouldn't happen either, so
my patch just adds some unnecessary noise.

Helge
