From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: blink loadavg LEDs on Oops
Date: Tue, 06 Jan 2009 16:44:14 +0100
Message-ID: <49637C4E.20107@gmx.de>
References: <49635B41.5060205@gmx.de> <7d01f9f00901060728w2001ed38v15c305d1472cb66@mail.gmail.com> <49637B5E.7010103@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Thibaut VARENE <varenet@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49637B5E.7010103@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:
> Thibaut VARENE wrote:
>> On Tue, Jan 6, 2009 at 2:23 PM, Helge Deller <deller@gmx.de> wrote:
>>> - blink loadavg LEDs only (not all LEDs) twice a second on Oops
>> Just out of curiosity, why wouldn't you want to have all leds blinking
>> on something as serious as an Oops? I kind of liked to clearly see
>> when something went wrong...
> 
> Yeah, valid question.
> 
> While doing some bugfixing on the HIL drivers I noticed that suddenly
> all LEDs were lit on the 715/64. It was strange, as I still was using...

I meant: The LEDs were blinking twice per second, not full-time on.
