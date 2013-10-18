From: Helge Deller <deller@gmx.de>
Subject: Re: 3.12-rcX - NFS regression - kswapd0 / kswapd1 stays using 100%
 CPU?
Date: Fri, 18 Oct 2013 21:26:23 +0200
Message-ID: <52618B5F.4000508@gmx.de>
References: <52604BA9.20104@gmx.de> <1382044045.3216.44.camel@leira.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-7
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	NFS list <linux-nfs@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Myklebust, Trond" <Trond.Myklebust@netapp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1382044045.3216.44.camel@leira.trondhjem.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/17/2013 11:07 PM, Myklebust, Trond wrote:
> On Thu, 2013-10-17 at 22:42 +0200, Helge Deller wrote:
>> I'm seeing a regression with current kernel git head when using NFS-mounts.
>> Architecture in my case is parisc, although I don't think that this is relevant.
>> At least kernel 3.10 (and I think 3.11) didn't showed that problem.
>>
>> The symtom is, that "top" shows high usage of either kswapd0 or kswapd1.
>> Here is an output with kswapd1:
>>   PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM     TIME+ COMMAND
>>    37 root      20   0     0    0    0 R  91.8  0.0  63:00.40 kswapd1
>> 28448 root      20   0  3252 1428 1060 R  15.3  0.0   0:00.09 top
>>     1 root      20   0  2784  988  852 S   0.0  0.0   0:09.95 init
>>
>> This is what ps shows:
>> lsXXXX:~# ps -ef |  grep mount
>> root      1181     1  0 14:51 ?        00:00:18 /usr/sbin/automount --pid-file /var/run/autofs.pid
>> root     25331  1181  0 21:25 ?        00:00:00 /bin/mount -n -t nfs -s -o nolock,rw,hard,intr homes:/unixhome1 /net/home1
>> root     25332 25331  0 21:25 ?        00:00:00 /sbin/mount.nfs homes:/unixhome1 /net/home1 -s -n -o rw,nolock,hard,intr
>>
>> And using sysrq to show the blocked tasks I get in syslog:
>> SysRq : Show Blocked State
>> mount.nfs       D 00000000401040c0     0 25332  25331 0x00000010
>> Backtrace:
>> [<0000000040113a68>] __schedule+0x500/0x810
>>
>> I know it's not a problem of the NFS server, since the same mount is still ok on other machines.
>> The NFS directory was already mounted and in use when this mount happened again (called by cron-job). 
>>  
>> Any ideas?
> 
> If the NFS directory is already mounted, then why is the automounter
> trying to mount it a second time?

I was wrong in this.
The directory wasn't mounted yet (or at least it was unmounted in the meantime before the new
mount.nfs was called).

I'm now not even sure, that the high kswapd is really triggered by the NFS problem,
because I now have another machine with the blocked NFS-mount, but without
the high kswapd usage.

Nevertheless, the blocked nfs mount tasks really make me wonder. There is clearly
some kind of regression since it doesn't happen with older kernels.

Helge
