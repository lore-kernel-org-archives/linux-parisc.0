From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Sort output dynamic relocations.
Date: Sun, 10 Jul 2011 21:27:26 -0400
Message-ID: <CADZpyiwLzQmQRHM0VOgfc7hxT3ZdXBuchb64O3v2poYMTC93oA@mail.gmail.com>
References: <CADZpyiyS2m9cc=RuUg+DOc3xfEMFOAfdYWwFLbjDTUmgqtnDsQ@mail.gmail.com>
	<4E15F06E.8040601@bell.net>
	<CADZpyixAMSZaNY_cU09MEz+bbH4yUvyGxcmZxbiAqJU4hK-7WQ@mail.gmail.com>
	<6957FCF8-0667-4DEF-8134-EACB33D47A13@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <6957FCF8-0667-4DEF-8134-EACB33D47A13@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 9, 2011 at 11:08 AM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> As far as I can tell, most targets don't sort dynamic relocations. =A0=
The
> exceptions that I see are mips and score. =A0Doing this will increase=
 link time, so I
> tend to think it should be avoided if possible. =A0Isn't the dynamic =
loader a special case?

Ulrich Drepper says that relative relocations must *always* be first,
it doesn't require a complete sort.

The dynamic loader is a special case, but there are some requirements.

> Have you tried the ld "-z combreloc" option to see if that works? =A0=
It
> combines reloc sections and sorts them.

I haven't tried that yet, are you saying we should change binutils to
*default* to "-z combreloc?"

> If "-z combreloc" doesn't produce the right order, then we will need
> something similar to elf_hppa_sort_unwind(). =A0elfxx-mips.c has a co=
mpare function
> sort_dynamic_relocs.

That sounds like a good place to start if the latter fails.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
