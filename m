Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85560482A
	for <parisc-linux@parisc-linux.org>; Wed, 22 May 2002 03:39:09 -0600 (MDT)
Message-ID: <3CEB64D3.8030500@freebel.net>
Date: Wed, 22 May 2002 09:28:51 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] stalling system clues + parisc WCHAN hack
References: <E17AAjL-00079M-00@paul.bame>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Paul,

Paul Bame wrote:
...
> 
> Linux b2000 2.4.18-pa25 #22 Fri May 17 11:04:28 MDT 2002 parisc unknown
> 
>   PID CMD              S WCHAN
>     1 ini              S pipe_poll
>     2 [keventd]        S context_thread
...

>  5368 setiathome -nice R wait_on_buffer
>  5381 ps -eo pid,cmd,s R wait_on_buffer
> 
>         total:    used:    free:  shared: buffers:  cached:
> Mem:  525357056 521830400  3526656        0 70672384 356921344
> Swap: 511696896  5632000 506064896
> MemTotal:       513044 kB
> MemFree:          3444 kB
> MemShared:           0 kB
> Buffers:         69016 kB
> Cached:         347420 kB
> SwapCached:       1136 kB
> Active:         112296 kB
> Inactive:       329744 kB
> HighTotal:           0 kB
> HighFree:            0 kB
> LowTotal:       513044 kB
> LowFree:          3444 kB
> SwapTotal:      499704 kB
> SwapFree:       494204 kB

Another question:
Do you feel normal that your system swap (swap used 5632000) with 512Mb 
of physical memoy?
I also observe this with my b2000 with 256Mb (just installed last week); 
I started to recompile the last cvs kernel and at the begining, top 
shows me mem used 22Mb and swap used 0Mb at the end more 100Mb of swap 
was used?

I do not understand very well: gcc did not cleanup correctly its space, 
  is it a kernel problem in managment of swap space or top showing wrong 
values?

Thanks in advance for info,
Joel
