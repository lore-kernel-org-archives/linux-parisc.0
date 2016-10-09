From: Helge Deller <deller@gmx.de>
Subject: Re: parisc crash on boot with 4.8+git
Date: Sun, 9 Oct 2016 21:54:33 +0200
Message-ID: <57FAA079.5010502@gmx.de>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
 <57F96010.1040309@gmx.de> <alpine.LRH.2.20.1610091032210.12761@math.ut.ee>
 <57FA089F.1020301@gmx.de> <alpine.LRH.2.20.1610092356270.32571@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1610092356270.32571@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 09.10.2016 23:09, Meelis Roos wrote:
>>>> Even if you fix the kernel with the patches above, you still may run
>>>> into the palo bug. I've just pushed a fix for it into the palo tree:
>>>> https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/commit/?id=70bd7a9a41e318c0575755a78c4d18ad97495c47
>>>>
>>>> If you rebuild palo, please make sure to install the new ipl boot loader into
>>>> the palo partition of your boot disc. palo should report at bootup version 1.96.
>>
>> Same here. Please pull latest version, and install it:
>> https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/
> 
> palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100
> 
> Just palo with newst upstream kernel git did not change anything, so 
> it's not palo.
> 
> 
> Pulled 
> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git 
> but it seems to be alreay up to date - these commits are in my tested 
> upstream that broke the booting?

Really? I just updated it a few hours ago. Please pull the "for-next" branch.

Can you send the last line of your "System.map" file, e.g.
0000000041f00000 B _end

What is the output of palo when booting ?

Helge
