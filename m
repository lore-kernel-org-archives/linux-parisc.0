From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: Does there exists any 32bit-only PARISC SMP machines?
Date: Tue, 3 Sep 2013 17:56:44 +0200
Message-ID: <20130903155643.GA1430@glitch>
References: <521F9848.4010404@gmx.de>
 <1377830541.2331.5.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1377830541.2331.5.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Aug 30, 2013 at 06:42:21AM +0400, James Bottomley wrote:
> On Thu, 2013-08-29 at 20:51 +0200, Helge Deller wrote:
> > Hi all,
> > 
> > I was asked by the debian kernel team to drop on parisc the UP kernels
> > and only provide SMP kernels even for UP-machines.
> 
> > For 64bit it might make sense to only ship a 64bit SMP kernel, but I'm
> > not sure if it makes sense for 32bit kernels.
> > One major question would be, if there exists any 32bit parisc machines
> > which support multiple CPUs at all?
> > If not, then it would make sense to drop the 32bit SMP kernels
> > instead.  
> > 
> > So, are there any 32bit SMP machines out there?
> 
> Yes, the J class systems have some 32 bit only SMP boxes (well one, the
> J210XC, I think) ... mostly with 7200 and above processors.

J5600 is SMP capable in both 32bit and 64bit mode.

> 
> > Any other thoughts on this topic?
> 
> SMP will certainly work.  The main problem with SMP on UP is the
> unnecessary spinlock cost.  I think given there's very few owners of J
> class SMP 32 bit systems, 32 bit UP and 64 bit SMP is OK.

mine doesn't boot 64bit SMP since 2.6.22. I've never been able to trace
it down but can confirm it happens also on more recent kernels.

at the moment, if I want SMP I need 32 bit.

Domenico
