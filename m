From: Helge Deller <deller@gmx.de>
Subject: Re: 3.12-rcX - NFS regression - kswapd0 / kswapd1 stays using 100%
 CPU?
Date: Sat, 19 Oct 2013 20:27:44 +0200
Message-ID: <5262CF20.20301@gmx.de>
References: <52604BA9.20104@gmx.de>		 <1382044045.3216.44.camel@leira.trondhjem.org> <52618B5F.4000508@gmx.de>	 <1382124981.20461.4.camel@leira.trondhjem.org> <5261940A.4090101@gmx.de> <1382127133.20461.9.camel@leira.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-7
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	NFS list <linux-nfs@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Myklebust, Trond" <Trond.Myklebust@netapp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1382127133.20461.9.camel@leira.trondhjem.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/18/2013 10:12 PM, Myklebust, Trond wrote:
> On Fri, 2013-10-18 at 22:03 +0200, Helge Deller wrote:
>> On 10/18/2013 09:36 PM, Myklebust, Trond wrote:
>>> Also, could you please try a sysRQ-t the next time it happens, so that
>>> we can get a trace of where the mount program is hanging. Knowing that
>>> the mount is stuck in "__schedule()" is not really interesting unless we
>>> know from where that was called.
>>
>> Actually, the machine was still running in this state.
>> Here is sysrq-t:
>> [112009.084000] mount           S 00000000401040c0     0 25331      1 0x00000010
>> [112009.084000] Backtrace:
>> [112009.084000]  [<0000000040113a68>] __schedule
>> [112009.232000]
>> [112009.232000] mount.nfs       D 00000000401040c0     0 25332  25331 0x00000010
>> [112009.232000] Backtrace:
>> [112009.232000]  [<0000000040113a68>] __schedule
> 
> That makes no sense unless sysrq-t works differently on parisc than on
> other platforms. I'd expect the backtrace to at least include a system
> call. Parisc experts?

sysrq-t doesn't work differently on parisc. For other processes I do get
a backtrace like the one on x86_64.
That's the main reason why I asked for ideas here on the list.
I do see the stuck process, but don't see any indications where it comes from.

Helge
