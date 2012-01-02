From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: Happy New Year PARISC
Date: Sun, 1 Jan 2012 22:23:43 -0800
Message-ID: <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Dec 31, 2011 at 4:02 PM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> Hi all,
>
> After a lot of trial and error, I believe that I have resolved the ra=
ndom
> segmentation faults
> on SMP PA8800 and PA8900 systems. =C2=A0This includes the libgomp hpm=
c's which
> turned
> out to be caused by a non-equivalent alias mapping in libattr (I hadn=
't
> rebuilt the attr
> package because there is a build issue with the current version in
> unstable). =C2=A0This was
> hard to find!

Wow! Happy New Year!

Well Done!
That must have been incredibly hard to find. It's a bummer the only
way we can find those sorts of things is by unraveling crash dumps. :(

> I have started working on setting up magnum for buildd.

If I can download a bunch of .debs, I'd be happy to install and run
some tests on my j6k.

cheers,
grant
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
