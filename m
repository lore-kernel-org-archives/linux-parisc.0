From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hppa: glibc and gcc 4.6, "error: _rtld_global_ro causes a section
 type conflict"
Date: Wed, 25 Apr 2012 00:05:46 -0400
Message-ID: <CADZpyizS_HE4YLvw=ssi2Wi33q_c8L0MRECaUjhC7kKMtg6baQ@mail.gmail.com>
References: <CADZpyix39LFL7MccuovarhdbpVCO8aSmBMH1hjK+4bn=ZYsXaA@mail.gmail.com>
	<BLU0-SMTP9C263F5C55BC27550263497260@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	libc-ports@sourceware.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP9C263F5C55BC27550263497260@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 24, 2012 at 7:55 PM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> On 15-Apr-12, at 11:00 AM, Carlos O'Donell wrote:
>
>> When compiling glibc on magnum with gcc-4.6 I get an odd failure abo=
ut
>> section type conflicts.
>
>
>
> After discussing the issue with Jakub Jelinek, =A0it appears the bug =
is caused
> by placing
> function labels (plabels) in the constant pool.

Interesting.

> PA has done this for longer
> than I can
> remember, but it doesn't appear necessary. =A0As you know, only ia64 =
and pa
> use plabels.

Yes, we both rely on the plabel code in glibc.

> This causes the setting of default flags for .data.rel.ro which confl=
ict
> with those needed
> for _rtld_global_ro in the dynamic linker. =A0The problem doesn't hav=
e
> anything directly
> to do with the handling of the variable _rtld_global_ro. =A0This was =
what was
> confusing
> me as everything seemed generic.

Me too.

> I am testing a fix. =A0Your testcase compiles successfully with the f=
ix.

Excellent!

> The issue is incredibly subtle. =A0I would guess it was just a matter=
 of luck
> that other targets
> aren't affected given that the code in rtld.c is not exactly exactly =
kosher
> from GCC POV.

The dynamic linker isn't exactly kosher :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
