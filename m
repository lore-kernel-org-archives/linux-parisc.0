From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Changes to fcntl.h and F_* numbers?
Date: Sun, 29 Nov 2009 19:19:22 -0500
Message-ID: <119aab440911291619h649736f7hc077412ca8ce890c@mail.gmail.com>
References: <119aab440911181222v79ad775ena36a4140e80847e3@mail.gmail.com>
	 <20091119032220.GG28962@bombadil.infradead.org>
	 <119aab440911190900t62122ed8m987c55821ca64062@mail.gmail.com>
	 <1258651414.6363.12.camel@mulgrave.site>
	 <119aab440911201457j1727576blde3c62569f927711@mail.gmail.com>
	 <4B10509D.3020400@gmx.de>
	 <119aab440911291017h1704a159j61421323b8099a3@mail.gmail.com>
	 <4B12D1BD.90602@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B12D1BD.90602@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Nov 29, 2009 at 2:55 PM, Helge Deller <deller@gmx.de> wrote:
> Those were added by this commit:
>
> commit ba0a6c9f6fceed11c6a99e8326f0477fe383e6b5
> Author: Peter Zijlstra <a.p.zijlstra@chello.nl>
> Date: =A0 Wed Sep 23 15:57:03 2009 -0700
> =A0 =A0fcntl: add F_[SG]ETOWN_EX
>
> Linux kernel 2.6.31 was tagged:
> Date: =A0 Wed Sep 9 15:13:59 2009 -0700
> (according to the git-log of the top Makefile)
>
> So I don't think they were ever in any released kernel.

Thanks Helge. I'll make sure glibc gets adjusted according to the new n=
umbers.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
