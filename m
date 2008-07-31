From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Cupertino test ring problem?
Date: Thu, 31 Jul 2008 10:26:24 -0700
Message-ID: <4891F5C0.8010307@hp.com>
References: <1217254746.3503.61.camel@localhost.localdomain>	<20080728145712.GH18026@parisc-linux.org> <488DFD62.4080307@hp.com>	<20080728171500.GB16059@parisc-linux.org> <488F777E.6090405@hp.com>	<1217363136.6103.68.camel@localhost.localdomain>	<488F842F.3040000@hp.com>	<1217369386.6103.73.camel@localhost.localdomain> <20080731051524.GC18732@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Matthew Wilcox <matthew@wil.cx>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080731051524.GC18732@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Tue, Jul 29, 2008 at 05:09:45PM -0500, James Bottomley wrote:
> 
>>On Tue, 2008-07-29 at 13:57 -0700, Rick Jones wrote:
>>
>>>>gsyprf11 and gsyprf10 are still not responding to pings ... could the
>>>>IP routings have changed or something?
>>>
>>> > I can't connect to port 22 on any of gsyprf3, gsyprf10 or gsyprf11.
>>>
>>>Well, the IP's have remained the same, but the systems are physically in 
>>>a different building.  Both netperf.org and ftp.cup.hp.com have moved 
>>>from the same starting point to the same end-point.  If folks cannot 
>>>ping them or cannot get to port 22 on those then there is still 
>>>something amis in the network.  Otherwise there is still something amis 
>>>with gsyprf[3|10|11].
>>
>>gsyprf10 at least is one of the ia64 boxes.  Helpfully it identifies
>>itself as lp1000 or something at the login prompt.
> 
> 
> gsyprf10 is an x86 machine (HP lp1000r netserver).
> 
> 
>>gsyprf11 is a PA A500 type box.  It should identify as gsyprf11
>>at the login prompt.  We
>>only need one up and running to begin diagnosing as we should be able to
>>then get to other remote consoles.
> 
> 
> I'll check with Rick tomorrow to see when I can drop by to help resurrect
> them.
> 
> I expected gsyprf10 to auto reboot on it's own.
> I'll change gsyprf11 and gsyprf3 to also autoboot since I don't think they
> do at the moment.

I can confirm that gsyperf3 was/is not set to autoboot.  I can also 
state that it cannot successfully boot.  During POST it spits-out FRU 
problem messages and during OS boot boatloads of Segmentation Fault 
output while it tries to boot, and end-up in busybox.

I'm not sure that gsyprf11 (pa) is connected to the external net.

I tried swapping the cables on gsyprf10 (the lp1000r)  I have to see if 
I can find the old monitor and keyboard to see what its boot state 
happens to be.

Grant - wrt times, I'm here all week, from about 0930 to about 0330 each 
day.  I'd be around later but this week I'm playing single-parent :)

rick jones
