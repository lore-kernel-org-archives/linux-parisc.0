From: John David Anglin <dave.anglin@bell.net>
Subject: Re: mmap problem in localedef
Date: Mon, 5 Dec 2016 13:49:05 -0500
Message-ID: <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee>
 <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-12-05 1:10 PM, Aaro Koskinen wrote:
> Hi,
>
> On Mon, Dec 05, 2016 at 01:36:17PM +0200, Meelis Roos wrote:
>> I noticed that locale-gen fails to work on my gentoo. Before reporting
>> to getnoo I tried to understand whether there is something specific to
>> parisc and here is the relevant part of strace from localedef
>> invocation:
>>
>> 1761  open("//usr/lib/locale/locale-archive.yvHI9a", O_RDWR|O_CREAT|O_EXCL, 0600) = 3
>> 1761  write(3, "\336\2\1\t\0\0\0\0\0\0\0008\0\0\0\0\0\0\3\213\0\0*\274\0\0\0\0\0\0\35L"..., 56) = 56
>> 1761  ftruncate64(3, 103860)            = 0
>> 1761  mmap2(NULL, 536870912, PROT_NONE, MAP_SHARED, 3, 0) = 0xd79bd000
>> 1761  mmap2(0xd7c00000, 103860, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, 3, 0) = -1 EINVAL (Invalid argument)
>> 1761  unlink("//usr/lib/locale/locale-archive.yvHI9a") = 0
>> 1761  write(2, "cannot map archive header", 25) = 25
>> 1761  write(2, ": Invalid argument", 18) = 18
>> 1761  write(2, "\n", 1)                 = 1
>> 1761  exit_group(1)                     = ?
>>
>> Do I read it correctly that it creates PROT_NONE mapping on file opened
>> O_RDWR, then tries to create a PROT_READ|PROT_WRITE mapping from the
>> same file at fixed location and fails?
>>
>> Why should it fail - because the fixed location is not suitable?
> This is known longstanding issue: https://sourceware.org/bugzilla/show_bug.cgi?id=19838
But why has it come back?  What kernel and glibc versions are you 
using?  This patch was supposed
to have fixed issue:
http://marc.info/?l=git-commits-head&m=138617700412279&w=2

I think the local-shmlba.diff patch was removed but I can't check at the 
moment.
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=725508

Dave
-- 

John David Anglin  dave.anglin@bell.net

