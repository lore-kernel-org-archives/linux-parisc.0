From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Sun, 31 Jan 2010 11:52:21 -0500
Message-ID: <119aab441001310852u687139b3rf711997e4e2e4b83@mail.gmail.com>
References: <119aab441001290808g51a80822m91ff468cc07fa0ed@mail.gmail.com>
	 <20100131163906.58A5C4EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100131163906.58A5C4EA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 31, 2010 at 11:39 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Could you look at GCC target/42850? =A0This is for the same testcase.
>
> It looks like glibc either has a hidden dependence on libgcc_s, or
> we have a dynamic loader bug. =A0See comment #3.

Hidden? :-)

The implementation of pthread_cancel_init in NPTL uses the unwinder in
libgcc_s.so.

Each target must tell glibc which version of the library is *current*
in order for glibc to dlopen that version and use the provided
unwinder.

We define it like this:
glibc-ports/sysdeps/hppa/libgcc_s.h
/* Name of libgcc_s library provided by gcc.  */
#define LIBGCC_S_SO "libgcc_s.so.4"

If you bump the version number you need to tell me, and then we
coordinate with debian to release a new libgcc_s.so, followed by an
updated glibc.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
