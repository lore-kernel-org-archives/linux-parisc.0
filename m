From: John David Anglin <dave.anglin@bell.net>
Subject: Re: INEQUIVALENT ALIASES in 3.11-rc3
Date: Thu, 1 Aug 2013 10:15:53 -0400
Message-ID: <BLU0-SMTP31D8AC5BCBAB50119B78C997500@phx.gbl>
References: <alpine.SOC.1.00.1307310003070.19136@math.ut.ee> <51F8DC7B.9090504@gmx.de> <alpine.SOC.1.00.1308011226170.14037@math.ut.ee>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1308011226170.14037@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1-Aug-13, at 5:28 AM, Meelis Roos wrote:

>>> I tried 3.11-rc3 yesterday on my RP3440. It works, but has  
>>> acquired a
>>> new warning during Gentoo emerge cycle:
>>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>>> conftest
>>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>>> conftest
>>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>>> conftest
>>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>>> conftest
>>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>>> conftest
>>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>>> conftest
>>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>>> conftest
>>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>>> conftest
>>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>>> conftest
>>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>>> conftest
>>>
>>> There is no file named conftest present after emerge, so it must  
>>> have
>>> been some temporary program.
>>
>> Those warnings are uncritical - but you should update binutils.
>> See: http://permalink.gmane.org/gmane.linux.ports.parisc/3834
>
> I did a full deep emerge update on Gentoo taht also installed binutils
> 2.23.1. I will look for further messages when there is something new  
> to
> upgrade - during the same upgrade, it got messages about locale- 
> archive.


conftest is the name of the test program used by configure.  It's  
output log is in config.log in the directory
being configured.

As I said, the above messages typically occur when a core dump  
occurs.  This is because the core dump
flushes all the mappings that the application has and the kernel  
detects the inequivalent aliases.  Probably,
this occurred twice in the package being configured.

It is easy to generate inequivalent aliases with a custom linker  
script.  It's quite likely they are being generated
by the eglibc package but that's just a guess.

Dave
--
John David Anglin	dave.anglin@bell.net



