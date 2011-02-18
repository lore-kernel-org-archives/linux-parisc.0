From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: binutils change break glibc build
Date: Fri, 18 Feb 2011 10:28:22 -0500
Message-ID: <AANLkTi=BekT-21PcsG_==PkvjiLcwsi14x3dA+wEFxrA@mail.gmail.com>
References: <AANLkTikL=ANnoEE6=orNbqkinW4-pEngWKh6UkBLWx5v@mail.gmail.com>
	<20110218143901.B1ADB4E51@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Frysinger <vapier@gentoo.org>, dave.anglin@nrc-cnrc.gc.ca,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110218143901.B1ADB4E51@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Feb 18, 2011 at 9:39 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Binutils should not merge the special function pointers used to mark
> the start and end of the .ctors/.dtors lists. =A0This could be tested
> for in libc, but this is inefficient. =A0On architectures that use
> function descriptors, function pointer comparisons are messy. =A0Do
> we want to call the infamous cffc in the dynamic loader? =A0Casts of
> function pointers to integer types are implementation defined and
> pointer sizes can vary. =A0So, the simple hack could break.
>
> In my opinion, binutils should be fixed to work with old glibc
> versions. =A0There is a work around in my binutils PR.

I would like __cffc to eventually go away. It's only required because
of the incorrectly implemented PLABEL support in binutils. A PLABEL in
the executable should not be resolved to a PLT entry, it should remain
a relocation for the dynamic loader to resolve. Once that's fixed,
eventually __cffc will go away. That's a project that is only agenda
after some glibc cleanup.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
