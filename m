From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: blink loadavg LEDs on Oops
Date: Tue, 06 Jan 2009 16:40:14 +0100
Message-ID: <49637B5E.7010103@gmx.de>
References: <49635B41.5060205@gmx.de> <7d01f9f00901060728w2001ed38v15c305d1472cb66@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Thibaut VARENE <varenet@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00901060728w2001ed38v15c305d1472cb66@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thibaut VARENE wrote:
> On Tue, Jan 6, 2009 at 2:23 PM, Helge Deller <deller@gmx.de> wrote:
>> - blink loadavg LEDs only (not all LEDs) twice a second on Oops
> 
> Just out of curiosity, why wouldn't you want to have all leds blinking
> on something as serious as an Oops? I kind of liked to clearly see
> when something went wrong...

Yeah, valid question.

While doing some bugfixing on the HIL drivers I noticed that suddenly
all LEDs were lit on the 715/64. It was strange, as I still was using
the machine and it was running fine.

The reason why the LEDs were lit was, that oops_in_progress was set due
a bug in my code. In dmesg I saw:
BUG: rwlock cpu recursion on CPU#0, modprobe/1098, 00a1599c
Backtrace:
 [<102a9c78>] _raw_write_lock+0x54/0x8c
 ....

So, whenever the kernel hits such a WARNING(), all LEDs will blink.
Now after my patch, the 4 LEDs on the left side blink (they are currently
not used anyway), while Heartbeat, disk-IO and LAN in/out still work
as usual. So, you will notice the 4 LEDs at once as well, but in addition
you still have the possibility to see if LAN goes in/out (e.g. if you ping
the machine) or if the heartbeat still works (and so your machine should 
still be reachable).

Helge
