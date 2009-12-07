From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: my usual problem with 64bit kernel
Date: Tue, 8 Dec 2009 00:44:04 +0100
Message-ID: <20091207234404.GA5083@raptus.dandreoli.com>
References: <20091204172838.GA4551@raptus.dandreoli.com>
 <4B1959E2.1030700@gmx.de>
 <20091205083511.GA6559@raptus.dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091205083511.GA6559@raptus.dandreoli.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Dec 05, 2009 at 09:35:11AM +0100, Domenico Andreoli wrote:
> On Fri, Dec 04, 2009 at 07:50:10PM +0100, Helge Deller wrote:
> 
> > I just want to make sure, that you have more or less a correct kernel
> > configuration setup (.config)....
> 
> there is at least a configuration glitch which makes my kernel hang
> and the debian one continue in degraded mode. i attached also the
> configuration, just in case i forgot something important.

i found the configuration glitch, it is CONFIG_DEBUG_MUTEXES. if it is
set, 64bit hangs right after "Releasing cpu 1 now, hpa=...", otherwise
the 64bit boot continues with a "SMP: CPU:1 is stuck."

BTW, i found my previous report of this bug: http://lkml.org/lkml/2008/4/20/251

cheers,
Domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://www.dandreoli.com/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
