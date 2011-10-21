From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Fri, 21 Oct 2011 10:49:31 -0400
Message-ID: <CADZpyizJx5fHwv5aHqoN-u1D95ph6dw8S+cAHKRS=MR6Y0WaPQ@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
	<20111017152358.GA3518@glitch>
	<CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com>
	<4E9C6F9E.5000605@bell.net>
	<BLU0-SMTP701E485C5A8DBAF113D35E97EB0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP701E485C5A8DBAF113D35E97EB0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Oct 19, 2011 at 9:47 PM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> I looked at this a bit. =A0The problem is legitimize_tls_address does=
n't work
> properly. First, GCC doesn't know that the libcall needs r26 and ret0=
 when the
> __thread variable is an argument to a call. =A0Secondly, the implemen=
tation of __tls_get_addr
> clobbers some other call clobbered registers. =A0I'm thinking the gli=
bc implementation
> might need to be in assembly language so that the clobbered registers=
 are limited (i.e.,
> it needs to save registers). =A0 This all seems really ugly...
>
> The issues occur in generating PIC code.

Yes, __tls_get_addr is a normal C function and follows normal function
register usage.

Why does __tls_get_addr need to be a special function?

Almost all the targets in glibc-ports have C versions of __tls_get_addr=
=2E

=46or example I notice that on Alpha the call to __tls_get_addr is *not=
*
done via a emit_library_call_value, instead they use some emit_insn,
emit_libcall_block and use_reg.

So it looks like they tamper with the register usage via use_reg
before the call to __tls_get_addr?

Another example is Sparc which also uses a custom sequence and
manipulates the used registers.

I think our legitimize_tls_address needs to be rewritten to match
something like what alpha or sparc has, otherwise we are going to run
into trouble trying to get emit_library_call_value to work correctly.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
