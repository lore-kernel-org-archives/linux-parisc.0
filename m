From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Sun, 31 Jan 2010 14:15:06 -0500
Message-ID: <119aab441001311115i75dc4cdcl195dedd55b5c63d9@mail.gmail.com>
References: <119aab441001311003j480f6e4u741ae15df2899b32@mail.gmail.com>
	 <20100131185251.1A9305145@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100131185251.1A9305145@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 31, 2010 at 1:52 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> Could you explain the change in more detail?
>
> The change is to set fs->signal_frame =3D 1 in signal frames in
> pa32_fallback_frame_state. =A0This affects the determination as to wh=
ether
> the IP is before or after the first not yet fully executed instructio=
n
> in a frame. =A0This feature was added in 2006 by Jakub Jelinek, but
> pa32_fallback_frame_state was not changed.

OK.

> This fixes unwinding in Ada (corner case). =A0It probably fixes corne=
r
> causes for other languages. =A0However, it breaks a number of Java te=
stcases.
> The problem is compensated for in the definition used for MAKE_THROW_=
=46RAME
> in libjava/include/pa-signal.h and hppa-signal.h.
>
> The Ada testcase that exposed this problem is new for 4.5.
>
> I'd hoped to bump the libgcc_s version so as to not break existing
> applications, but that appears impossible.

No, unfortunately the implementation of pthread_cancel() needs to use
the unwinder, and that means glibc assumes that the latest libgcc_s.so
can always unwind old code using some sort of fallback.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
