From: Graham Gower <graham.gower@gmail.com>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: -1
Date: Thu, 12 Mar 2015 10:01:40 +1030
Message-ID: <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com>
References: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl>
	<CADjby3WS3cJs2BOmYT4Cdr4i9FncD=BYjrkuQiBH3=VmOndRPw@mail.gmail.com>
	<BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Domenico Andreoli <cavokz@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	kirill@shutemov.name
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I thought this patch was supposed to address the problem?
https://lkml.org/lkml/2015/2/26/230

However, its not fixed it for me either in 4.0.0-rc3.

-Graham

On 12 March 2015 at 00:44, John David Anglin <dave.anglin@bell.net> wrote:
> On 2015-03-11 7:32 AM, Domenico Andreoli wrote:
>>
>> I also do. Related to https://lkml.org/lkml/2015/2/13/431?
>
> More info is here:
> http://www.spinics.net/lists/linux-mm/msg84937.html
>
> There doesn't seem to be a patch yet.
>
>
> Dave
>
> --
> John David Anglin  dave.anglin@bell.net
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
