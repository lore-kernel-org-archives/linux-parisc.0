From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Sun, 31 Jan 2010 13:03:17 -0500
Message-ID: <119aab441001311003j480f6e4u741ae15df2899b32@mail.gmail.com>
References: <119aab441001310852u687139b3rf711997e4e2e4b83@mail.gmail.com>
	 <20100131171307.E17D85145@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100131171307.E17D85145@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 31, 2010 at 12:13 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> We define it like this:
>> glibc-ports/sysdeps/hppa/libgcc_s.h
>> /* Name of libgcc_s library provided by gcc. =A0*/
>> #define LIBGCC_S_SO "libgcc_s.so.4"
>>
>> If you bump the version number you need to tell me, and then we
>> coordinate with debian to release a new libgcc_s.so, followed by an
>> updated glibc.
>
> Ugh! =A0This means that the change in unwind behavior (signal frames)
> would need to be backported to all active GCC versions. =A0libgcj wou=
ld
> also need fixing. =A0In principle, the whole application base would
> need recompilation to update to the new glibc version.

Could you explain the change in more detail?

You should only have to rebuild the whole application base if you
break the unwind ABI.

> I guess the minimal impact is to accept that the change in unwind
> behavior will break a few programs. =A0The java exception support
> compensated for the bug. =A0I'll back out the version bump.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
