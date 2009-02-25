From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Wed, 25 Feb 2009 11:18:36 +0100
Message-ID: <20090225111836.621412c1@i1501.lan.towertech.it>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<20090220170454.04382e9e@i1501.lan.towertech.it>
	<alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be>
	<1235511327.18632.73.camel@macbook.infradead.org>
	<20090224231154.60ba18d6@i1501.lan.towertech.it>
	<1235514727.18632.93.camel@macbook.infradead.org>
	<alpine.LRH.2.00.0902251059110.4063@vixen.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Geert.Uytterhoeven@sonycom.com,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Zidlicky <rz@linux-m68k.org>,
	linux-parisc@vger.kernel.org,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	David@ozlabs.org, Kyle McMartin <kyle@mcmartin.ca>,
	Linux/PPC Development <linuxppc-dev@ozlabs.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.0902251059110.4063@vixen.sonytel.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 25 Feb 2009 11:00:13 +0100 (CET)
Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:

> I didn't know NTP was broken with RTC class drivers?
> 
> So we should actually keep on using genrtc instead of rtc-ppc/rtc-generic for
> now? ;-)

 broken here means that the kernel won't save the time to the hardware
 rtc every 11 minutes as it used to do. normal NTP operations are unaffected.

-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

