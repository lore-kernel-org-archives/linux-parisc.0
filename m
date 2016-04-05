From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Kernel Panic on 4 cores hp c8000
Date: Tue, 5 Apr 2016 16:50:28 -0400
Message-ID: <57042514.7000503@bell.net>
References: <CACrbsaA0fw4KeKkcO5zZ50yMLsoysqJE6+ShfejCxDG9Zhns1Q@mail.gmail.com>
 <56FD5C30.4020409@gmx.de>
 <CACrbsaD4S7mPZcLT79FHU=fR+ecD6qaDyk1enHZ4zwG6y53MiA@mail.gmail.com>
 <alpine.LRH.2.02.1604051448230.28402@file01.intranet.prod.int.rdu2.redhat.com>
 <57040A95.2040509@gmx.de>
 <alpine.LRH.2.02.1604051615410.32758@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Simone Mannori <simone.mannori@gmail.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1604051615410.32758@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-04-05 4:18 PM, Mikulas Patocka wrote:
>
> On Tue, 5 Apr 2016, Helge Deller wrote:
>
>> On 05.04.2016 20:54, Mikulas Patocka wrote:
>>> On Thu, 31 Mar 2016, Simone Mannori wrote:
>>>>> I think Debian 5 will not even install on the C8000..
>>>> Correct: the boot DVD hang after a while.
>>> I installed Debian 5 on the C8000 (using tftp netboot, not DVD) some times
>>> ago.
>>>
>>> It required PCI serial card (because the Debian 5 kernel doesn't recognize
>>> the built-in serial ports) and PCI network card (the Debian 5 kernel can't
>>> handle the built-in E1000 network card due to non-standard checksum in the
>>> EEPROM).
>> ... and the debian 5 kernel was most likely *very* unstable on that machine ? :-)
>>
>> Helge
> Yes, it was very unstable. It took long time for the parisc port to
> stabilize.
I would say it took a change in the way the port is maintained. Helge 
and I communicate
closely.  I look at the buildd logs on a regular basis and try to push 
fixes for gcc problems
aggressively.  This causes some instability but I don't see any other 
choice.  We have also
pushed stuff to glibc.  More needs to be done there but the Debian patch 
set is reduced.
>
> Recently, I've got some gcc crashes when running kernel compilation in
> parallel with the LVM2 testsuite, so there may still be some stability
> bugs.
>
The LVM2 builds on Debian have been generally successful:
https://buildd.debian.org/status/logs.php?pkg=lvm2&arch=hppa
However, it looks as if testsuite isn't being run.

If you find something that is reproducible, please send along.

Dave

-- 
John David Anglin  dave.anglin@bell.net

