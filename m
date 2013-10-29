From: Helge Deller <deller@gmx.de>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Tue, 29 Oct 2013 20:50:51 +0100
Message-ID: <5270119B.6060908@gmx.de>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de> <20131026191720.5282c0c3@marga.jer-c2.orkz.net> <20131028105612.GB19852@alpha.franken.de> <20131029093706.GA6255@alpha.franken.de> <236d3862441c13623a9fde73e6988591@sf-mail.de> <20131029164151.GA10616@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131029164151.GA10616@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/29/2013 05:41 PM, Thomas Bogendoerfer wrote:
> On Tue, Oct 29, 2013 at 11:41:08AM +0100, Rolf Eike Beer wrote:
>> Oops, sorry, I misread the git log. I've now applied that patch to
> 
> no problem, maybe it's worth to send the fix to stable now it's
> in 3.12

Yes, I think it really makes sense to send this patch to stable kernel series.
Without this patch, any parisc box (ok - probably only the C8000) crashes
as soon as the ipmi driver is loaded.

Will you ask (e.g. if possible for kernel 3.0 and higher - not sure if it applies)? 

Helge
