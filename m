From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Fri, 21 Nov 2008 23:11:55 -0700
Message-ID: <20081122061155.GC12724@colo.lackof.org>
References: <49231FD0.9040409@gmx.de> <1227061902.10371.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1227061902.10371.11.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Nov 19, 2008 at 11:31:42AM +0900, James Bottomley wrote:
> On Tue, 2008-11-18 at 21:04 +0100, Helge Deller wrote:
> > I've tried various -rc candidates in the last few weeks, and sadly the 
> > parisc kernel is in pretty bad shape.
> > 
> > At the beginning I started to get problems only when I had USB 
> > keyboard/mouse attached to the PA machine. This lead to bugzilla 
> > http://bugzilla.kernel.org/show_bug.cgi?id=11913
> > 
> > Now, with -rc4 and -rc5 things got even worse.
> > 
> > Crashes happen often just directly at the beginning.
> > I'm sure it's not USB related any more, and I assume we have some 
> > strange mm-problem somewhere.
> 
> I'd be really dubious about that.  Our pa8900 ... the most mm unstable
> system we have ... is running -rc5 just fine.  The only warning before
> boot is the usual SMP one.

I'm not. During a normal kernel build:
/bin/sh: line 1:  2985 Trace/breakpoint trap   ( cat /dev/null ) > sound/mips/modules.order
make[2]: *** [sound/mips/modules.order] Error 133

Restarting the build allowed it to finish.
This is 2.6.28-rc5 trying to build itself again. I didn't see this
with -rc3 though it possible it's just chance that I didn't.

Config file is on:
   http://iou.parisc-linux.org/~grundler/2.6.28-rc5-config-j6000

(or gsyprf11:~grundler/public_html/2.6.28-rc5-config-j6000)



> Linux ion 2.6.28-rc5 #20 SMP Tue Nov 18 18:16:35 PST 2008 parisc64
> 
> Why don't we compare configs?  This is mine for ion:
> 
> http://parisc-linux.org/~jejb/config-2.6.28-rc5-ion
> 
> I suspect we have some nasty interaction in the device driver subsystem
> (ion, the pa8900, isn't running either USB or PDC stable).

That's possible. But the IOMMU code hasn't changed. I'm inclined
to believe another VM bug has crept in.

I agree with Dave that kernel hasn't gotten more stable since 2.6.22
kernel that we keep running on gsyprf11.

hth,
grant
