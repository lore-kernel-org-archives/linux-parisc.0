From: John David Anglin <dave.anglin@bell.net>
Subject: Re: INEQUIVALENT ALIASES in 3.11-rc3
Date: Wed, 31 Jul 2013 10:40:58 -0400
Message-ID: <BLU0-SMTP6115FA1E01E093C9487F1197570@phx.gbl>
References: <alpine.SOC.1.00.1307310003070.19136@math.ut.ee> <51F8DC7B.9090504@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51F8DC7B.9090504@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 31-Jul-13, at 5:44 AM, Helge Deller wrote:

> On 07/30/2013 11:06 PM, Meelis Roos wrote:
>> I tried 3.11-rc3 yesterday on my RP3440. It works, but has acquired a
>> new warning during Gentoo emerge cycle:
>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>> conftest
>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>> conftest
>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>> conftest
>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>> conftest
>> [  922.492000] INEQUIVALENT ALIASES 0x4197a000 and 0x7b000 in file  
>> conftest
>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>> conftest
>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>> conftest
>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>> conftest
>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>> conftest
>> [ 4577.536000] INEQUIVALENT ALIASES 0x41a76000 and 0x7b000 in file  
>> conftest
>>
>> There is no file named conftest present after emerge, so it must have
>> been some temporary program.
>
> Those warnings are uncritical - but you should update binutils.
> See: http://permalink.gmane.org/gmane.linux.ports.parisc/3834

I don't think we can assume that.  What I fixed was was the text and  
data mappings
where they overlappedi at the end of the text region:

[ 7649.720000] INEQUIVALENT ALIASES 0x13000 and 0x14000 in file tst- 
cputimer1
Virtual addresses 0x13000 and 0x14000 where both pointing at same  
page.  The mapping
mapping through 0x13000 was read only, so I think this case was  
probably harmless.  If the
inequivalent aliases above are writeable, then there is a problem.   
Compare the addresses
in the two cases.

Dave
--
John David Anglin	dave.anglin@bell.net



