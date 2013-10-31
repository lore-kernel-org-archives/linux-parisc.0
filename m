From: Helge Deller <deller@gmx.de>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Thu, 31 Oct 2013 13:22:35 +0100
Message-ID: <52724B8B.6070007@gmx.de>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de> <20131026191720.5282c0c3@marga.jer-c2.orkz.net> <20131028105612.GB19852@alpha.franken.de> <20131029093706.GA6255@alpha.franken.de> <236d3862441c13623a9fde73e6988591@sf-mail.de> <20131029164151.GA10616@alpha.franken.de> <5270119B.6060908@gmx.de> <20131031120606.GA17366@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131031120606.GA17366@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/31/2013 01:06 PM, Thomas Bogendoerfer wrote:
> On Tue, Oct 29, 2013 at 08:50:51PM +0100, Helge Deller wrote:
>> Yes, I think it really makes sense to send this patch to stable kernel series.
>> Without this patch, any parisc box (ok - probably only the C8000) crashes
>> as soon as the ipmi driver is loaded.
>>
>> Will you ask (e.g. if possible for kernel 3.0 and higher - not sure if
>> it applies)? 
> 
> 3.4 shows some fuzz and iirc there were some changes I needed to make for
> inclusion into latest kernels. Afaik all other C8k went only into 3.10,
> so that should be good enough. And the patch applies cleanly to 3.10.
> I'll write mail to the stable team.

If possible >= 3.8 would be good.
I'm not sure Debians main unstable installation kernel is 3.8...

Helge 
