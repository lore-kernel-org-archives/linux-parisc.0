From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Thu, 11 Jul 2013 00:19:26 +0400
Message-ID: <216411373487566@web6f.yandex.ru>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org> <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org> <51DC7996.3010405@bell.net> <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
To: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sorry for not CC'ing to the list.

10.07.2013, 03:35, "John David Anglin" <dave.anglin@bell.net>:

> =9AOn 9-Jul-13, at 4:59 PM, John David Anglin wrote:
>> =9A=9AOn 7/9/2013 3:45 PM, Alex Ivanov wrote:
>>> =9A=9AThe panic on SMP kernel changed to another one:
>>> =9A=9Ahttp://pastebin.com/SfUfd0Un
>> =9A=9AThis is just a guess but I don't think page is valid
>> =9A=9Aif the pfn is not valid. =9AYou might try this untested change=
=2E
>>
>> =9A=9Aflush_cache_mm might have same problem (i.e., we may need to
>> =9A=9Acheck whether the pfn for the pte is valid).
> =9AThis version compiles and boots on rp3440.
>
> =9ADave
> =9A--
> =9AJohn David Anglin dave.anglin@bell.net

Dave,

Thank you so much! Your guess looks to be right. After applying of your
patch there was no more KP and X just worked.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
