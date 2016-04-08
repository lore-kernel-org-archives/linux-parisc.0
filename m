From: Helge Deller <deller@gmx.de>
Subject: Re: Aw: Re: kernel 4.6-rc unbootable due to module changes
Date: Fri, 8 Apr 2016 21:43:09 +0200
Message-ID: <570809CD.3060203@gmx.de>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
 <570409DA.1060508@gmx.de>
 <alpine.LRH.2.02.1604051612310.32758@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604061014490.30369@file01.intranet.prod.int.rdu2.redhat.com>
 <57058332.8050204@gmx.de> <5706E3A0.2020902@gmx.de>
 <trinity-1ff986de-0345-446b-baa3-dce5d7ebc2cc-1460117169764@3capp-gmx-bs27>
 <trinity-2288a664-7ecc-47ba-9dbb-630a8f9060c7-1460127541349@3capp-gmx-bs27>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
To: unlisted-recipients:; (no To-header on input)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-2288a664-7ecc-47ba-9dbb-630a8f9060c7-1460127541349@3capp-gmx-bs27>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08.04.2016 16:59, Helge Deller wrote:
>>>>> So, it seems that handling exceptions from modules never worked on 
>>>>> pa-risc, it was just masked by the fact that exceptions from modules don't 
>>>>> happen during normal use.
>>>
>>> Sadly you seem to be right :-(
>>> I did more testing with the test_user_copy module (with vanilla kernel 4.5 and without the relative extable support).
>>
>> The attached patch fixes the exception handling for modules for me.
>> This is realized by saving the %r27 register in the fault handler and restoring it in the exception path.
>> With this patch the "test_user_copy" kernel module succeeds when loaded.
>> Mikulas, can you try it with your testcases ?
> 
> Attached patch additionally adds support for resolving R_PARISC_PCREL32 relocations,
> which fixes the 32bit extable change which was introduced with kernel 4.6-rc1.
> 
> With that I think we have all module issues resolved ?

I've pushed all relevant changes into my for-next tree which can be pulled:
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

Helge
