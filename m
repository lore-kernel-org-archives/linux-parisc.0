From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: Happy New Year PARISC (take 2)
Date: Mon, 30 Jan 2012 02:06:44 +0100
Message-ID: <CA+DQjFhU64FwAR9GBim4vKyEbE8hnzs9aLLVO23cNjfSdEiHEA@mail.gmail.com>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl> <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>
 <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl> <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl>
 <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com>
 <4F031B1A.4010908@bell.net> <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com>
 <4F032C4C.10805@bell.net> <1325608972.3185.8.camel@dabdike.int.hansenpartnership.com>
 <4F034B6B.5020809@bell.net> <BLU0-SMTP5091B64E5E2C07CEDC0D41978C0@phx.gbl> <CA+DQjFiTwKC76Hn-x-s2C9Nc_qkqrRFXv3ji22KGtgMzGOfx0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+DQjFiTwKC76Hn-x-s2C9Nc_qkqrRFXv3ji22KGtgMzGOfx0Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Reposting as vger is anal about mail format...

On Sun, Jan 29, 2012 at 10:45 PM, John David Anglin
<dave.anglin@bell.net> wrote:
>
> I believe both versions fix the minifail bug and some thread related =
bugs
> seen in the perl, python and git testsuites. =C2=A0However, there are=
 still more
> thread related bugs to fix.
>
> The minifail bug is fixed by the TLB purge added to ptep_set_wrprotec=
t,
> and flushing the `from' page in copy_user_page (kmap version). =C2=A0=
The
> tmpalias version doesn't need this flush, but the `to' page needs to =
be
> flushed. =C2=A0So, both versions have about the same flush requiremen=
ts.
>
> This version fixes the math emulation bug that I reported, but I have
> another one that I haven't tracked down.

That's awesome news!

If you want write access to the wiki to update e.g. this page
http://wiki.parisc-linux.org/TestCases=C2=A0I'd be more than happy to a=
dd
your account to the ACL.

> It would be great if someone else could test the change on something =
other
> than a rp3440. =C2=A0The cache issues are very subtle. =C2=A0If the r=
esults are positive,
> I will break up the patch and formally submit it.

Well I have an a500-5x (PA8600) that's doing nothing, but I really
don't have time to do any kind of testing now or in the near future.
I'd be happy to provide access to the hardware tho.

HTH

T-Bone

--
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
