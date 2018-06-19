From: John David Anglin <dave.anglin@bell.net>
Subject: Re: bpfilter compile failure on parisc
Date: Tue, 19 Jun 2018 19:05:03 -0400
Message-ID: <71d9d0f7-101b-34af-49a3-b45c2560edc4@bell.net>
References: <alpine.LRH.2.21.1806192036240.10716@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
To: Meelis Roos <mroos@linux.ee>, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.21.1806192036240.10716@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>

On 2018-06-19 1:38 PM, Meelis Roos wrote:
> Tried enabling bpfilter on parisc, got this:
>
>    HOSTCC  net/bpfilter/main.o
> net/bpfilter/main.c:3:21: fatal error: sys/uio.h: No such file or directory
>   #include <sys/uio.h>
Probably has something to do with the include directories searched by 
HOSTCC.  The location of
the file is "/usr/include/hppa-linux-gnu/sys/uio.h".

Dave

-- 
John David Anglin  dave.anglin@bell.net
