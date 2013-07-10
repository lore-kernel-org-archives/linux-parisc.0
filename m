From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK
 register
Date: Wed, 10 Jul 2013 16:28:56 -0400
Message-ID: <51DDC408.6040406@bell.net>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org> <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org> <51DC7996.3010405@bell.net> <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl> <216411373487566@web6f.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R; format=flowed
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <216411373487566@web6f.yandex.ru>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 7/10/2013 4:19 PM, Alex Ivanov wrote:
> Sorry for not CC'ing to the list.
>
> 10.07.2013, 03:35, "John David Anglin" <dave.anglin@bell.net>:
>
>>   On 9-Jul-13, at 4:59 PM, John David Anglin wrote:
>>>    On 7/9/2013 3:45 PM, Alex Ivanov wrote:
>>>>    The panic on SMP kernel changed to another one:
>>>>    http://pastebin.com/SfUfd0Un
>>>    This is just a guess but I don't think page is valid
>>>    if the pfn is not valid.  You might try this untested change.
>>>
>>>    flush_cache_mm might have same problem (i.e., we may need to
>>>    check whether the pfn for the pte is valid).
>>   This version compiles and boots on rp3440.
>>
>>   Dave
>>   --
>>   John David Anglin dave.anglin@bell.net
> Dave,
>
> Thank you so much! Your guess looks to be right. After applying of your
> patch there was no more KP and X just worked.
I have been studying this issue a bit more.  It looks to me as if it 
would be better to call
vm_normal_page to get the page.  It returns NULL when we a have special 
mapping that
doesn't want to be associated with a struct page.  See comment in 
mm/memory.c.

I'll send a patch when I get a chance to test this approach.

Dave

-- 
John David Anglin    dave.anglin@bell.net

