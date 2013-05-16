From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc boot crash on 3.10-rc1+git
Date: Thu, 16 May 2013 08:15:07 -0400
Message-ID: <BLU0-SMTP398CEC562539AB1F75942E97A30@phx.gbl>
References: <alpine.SOC.1.00.1305141432120.9094@math.ut.ee> <alpine.SOC.1.00.1305150957460.29631@math.ut.ee> <5193D0F5.4060706@gmx.de> <1536577.0f4jSevITp@eto> <alpine.SOC.1.00.1305160931430.23959@math.ut.ee>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1305160931430.23959@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 16-May-13, at 2:35 AM, Meelis Roos wrote:

>>> Ok, the good thing is, that I got today a rp5470 with which I could
>>> reproduce your problems.
>>>
>>> The bad thing is:
>>> Beside CONFIG_PREEMPT, CONFIG_DISCONTIGMEM is broken too.
>>
>> My C8000 runs 3.7.3 happily, so it must have happened after that.
>
> My RP3440 runs 3.9.0 fine, with mostly the same config as I sent  
> (modulo
> the new questions).


3.9.0 plus all parisc changes for 3.10 runs ok on my rp3440.  Do you  
have
the three parisc patches merged after 3.10-rc1?  There's only about  
one day's
worth of commits between what I have and 3.10-rc1.

I have CONFIG_DISCONTIGMEM set.

Memory Ranges:
  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
  1) Start 0x0000000100000000 End 0x00000001ffdfffff Size   4094 MB
  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
Total Memory: 8190 MB

--
John David Anglin	dave.anglin@bell.net



