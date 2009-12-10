From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: my usual problem with 64bit kernel
Date: Thu, 10 Dec 2009 19:47:27 +0100
Message-ID: <b40acdb70912101047ue82980aw3d0006084c2f59b1@mail.gmail.com>
References: <20091204172838.GA4551@raptus.dandreoli.com>
	 <4B1959E2.1030700@gmx.de> <20091205083511.GA6559@raptus.dandreoli.com>
	 <20091207234404.GA5083@raptus.dandreoli.com>
	 <20091209235038.GA12806@raptus.dandreoli.com>
	 <20091210170846.GA28962@bombadil.infradead.org>
	 <b40acdb70912101042k351d33b2ndac99a162969dfb4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <b40acdb70912101042k351d33b2ndac99a162969dfb4@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 10, 2009 at 7:42 PM, Domenico Andreoli <cavokz@gmail.com> wrote:
> On Thu, Dec 10, 2009 at 6:08 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
>> On Thu, Dec 10, 2009 at 12:50:38AM +0100, Domenico Andreoli wrote:
>>> On Tue, Dec 08, 2009 at 12:44:04AM +0100, Domenico Andreoli wrote:
>>> > On Sat, Dec 05, 2009 at 09:35:11AM +0100, Domenico Andreoli wrote:
>>> > > On Fri, Dec 04, 2009 at 07:50:10PM +0100, Helge Deller wrote:
>>> > >
>>> > > > I just want to make sure, that you have more or less a correct kernel
>>> > > > configuration setup (.config)....
>>> > >
>>> > > there is at least a configuration glitch which makes my kernel hang
>>> > > and the debian one continue in degraded mode. i attached also the
>>> > > configuration, just in case i forgot something important.
>>> >
>>> > i found the configuration glitch, it is CONFIG_DEBUG_MUTEXES. if it is
>>> > set, 64bit hangs right after "Releasing cpu 1 now, hpa=...", otherwise
>>> > the 64bit boot continues with a "SMP: CPU:1 is stuck."
>>>
>>> i was wrong, it's again CONFIG_DEBUG_SPINLOCK. if it is set, the
>>> boot hangs.
>>>
>>> i passed the last few days building kernels...
>>>
>>
>> So CONFIG_DEBUG_SPINLOCK causes hangs, with it unset, everything is
>> fine? Interesting. Sounds like initialization issues. I'll take a look soon.
>
> no exactly, with CONFIG_DEBUG_SPINLOCK unset kernel boots but still with
> 1 CPU and the "SMP: CPU:1 is stuck." message, this at 64bit.

FYI, it must be something old, the behavior is the same i reported here
http://lkml.org/lkml/2008/4/21/454 with 2.6.24.

> at 32bit and CONFIG_DEBUG_SPINLOCK unset (both gcc 4.3 & 4.4) i get
> the build error i reported in another thread. with CONFIG_DEBUG_SPINLOCK
> set kernel builds and runs nicely.

-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
