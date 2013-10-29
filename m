From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Tue, 29 Oct 2013 18:14:18 +0100
Message-ID: <20131029181418.16058582@marga.jer-c2.orkz.net>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
	<20131026191720.5282c0c3@marga.jer-c2.orkz.net>
	<20131028105612.GB19852@alpha.franken.de>
	<20131029093706.GA6255@alpha.franken.de>
	<236d3862441c13623a9fde73e6988591@sf-mail.de>
	<20131029164151.GA10616@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131029164151.GA10616@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 29 Oct 2013 17:41:51 +0100
Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:

> I've played only with ipmitool, which gives something like
> 
> c8000:~# ipmitool sdr
> Systemboard      | 30 degrees C      | ok
> CPU 1            | 43 degrees C      | ok

Yes, that works nicely here, too (in 3.12 rc6).


     jer
