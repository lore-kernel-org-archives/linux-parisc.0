Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 726734875
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 Oct 2003 00:29:19 -0600 (MDT)
Date: Fri, 24 Oct 2003 08:29:06 +0200
Message-ID: <3F97A05A000007B0@ocpmta1.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0310232036170.21111@sal.ucc.ie>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] TMPFS test?
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hello Max,
>>
>> I backport Randolph 2.6 works to 2.4.23-pre8-pa13 and test tmpfs which
seems
>> to works:
>
>Well, tmpfs works for me since ... 2.4.19 ?!
>
Sorry never heard before (the first time in a Randolph patch :) )

>> # bdf
[...]
>> tmpfs                   128048         0    128048   0% /var/tmp
>
>Okay, this says that you have 128MB allocated for tmpfs.
>This is correct, as tmpfs uses up to half of the physical ram if you
>don't specify the maximum size.
>Well, it doesn't 'allocate' the whole 128MB at once of course, it
>will just use as much as you put into the ram disk.

Clear

>[...]
>>
>> # cat /proc/meminfo
>>         total:    used:    free:  shared: buffers:  cached:
>> Mem:  26224640
>> 86798336 175448064        0  2965504 66297856
>> Swap: 256892928        0 256892928
>> MemTotal:       256100 kB
>> MemFree:        171336 kB
>> MemShared:           0 kB
>> Buffers:          2896 kB
>> Cached:          64744 kB
>> SwapCached:          0 kB
>> Active:          52432 kB
>> Inactive:        19836 kB
>> HighTotal:           0 kB
>> HighFree:            0 kB
>> LowTotal:       256100 kB
>> LowFree:        171336 kB
>> SwapTotal:      250872 kB
>> SwapFree:       250872 kB
>>
>> I just have a question: is it normal that /var/tmp is of about 256Mb when
>
>Mhh, perhaps I'm blind, but where do get the idea that tmpfs is using
>256MB and not (up to) 128MB ?

It comes from another commercial *nix based system which (always confusing
me and) uses /tmp to manage the physical memory + overall swap. [What is
confusing me is its global size (not only the available size as usual with
other fs) which can change as change the usage of swap?]
 
[..]
>As mentioned before (look at usr/src/linux/Documentation/filesystems/tmpfs.txt)

That is where I find how to use it but, my bad, I do not read all details.

Thanks for your help and patience,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
