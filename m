From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: Re: Does there exists any 32bit-only PARISC SMP machines?
Date: Wed, 4 Sep 2013 16:28:47 +0200
Message-ID: <20130904142847.GA2893@glitch>
References: <521F9848.4010404@gmx.de>
 <1377830541.2331.5.camel@dabdike>
 <20130903155643.GA1430@glitch>
 <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28>
 <20130904140705.GA30223@glitch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130904140705.GA30223@glitch>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 04, 2013 at 04:07:05PM +0200, Domenico Andreoli wrote:
> On Wed, Sep 04, 2013 at 10:13:09AM +0200, Helge Deller wrote:
> > Hi Domenico,
> 
> Helge,
> 
> > > J5600 is SMP capable in both 32bit and 64bit mode.
> > > mine doesn't boot 64bit SMP since 2.6.22. I've never been able to trace
> > > it down but can confirm it happens also on more recent kernels.
> > 
> > Could you please try a 64bit-SMP (stable series) 3.10 or 3.11 kernel?
> > I'm pretty sure your machine should now boot and work with a 64bit SMP kernel.
> > If not, please send your bootlog so that we can try to analyze.
> 
> yes, indeed. I realized aftewards I could have been more informative
> here. thanks for supporting :)
> 
> I confirm that smp parisc64 v3.11 doesn't bring up both the cpus on my
> system but at least it boots one, something that didn't happen in some
> darker moments since 2.6.22.
> 
> similar "SMP: CPU:1 is stuck." happens also with debian v3.10-parisc64-smp kernel.

BTW, this is the most detailed investigation I'm aware of:

https://lkml.org/lkml/2008/4/20/251

thanks,
Domenico
