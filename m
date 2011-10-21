From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Fri, 21 Oct 2011 13:42:48 -0400
Message-ID: <4EA1AF18.9010605@bell.net>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <20111017152358.GA3518@glitch> <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com> <4E9C6F9E.5000605@bell.net> <BLU0-SMTP701E485C5A8DBAF113D35E97EB0@phx.gbl> <CADZpyizJx5fHwv5aHqoN-u1D95ph6dw8S+cAHKRS=MR6Y0WaPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyizJx5fHwv5aHqoN-u1D95ph6dw8S+cAHKRS=MR6Y0WaPQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/21/2011 10:49 AM, Carlos O'Donell wrote:
> On Wed, Oct 19, 2011 at 9:47 PM, John David Anglin<dave.anglin@bell.net>  wrote:
>> I looked at this a bit.  The problem is legitimize_tls_address doesn't work
>> properly. First, GCC doesn't know that the libcall needs r26 and ret0 when the
>> __thread variable is an argument to a call.  Secondly, the implementation of __tls_get_addr
>> clobbers some other call clobbered registers.  I'm thinking the glibc implementation
>> might need to be in assembly language so that the clobbered registers are limited (i.e.,
>> it needs to save registers).   This all seems really ugly...
>>
>> The issues occur in generating PIC code.
> Yes, __tls_get_addr is a normal C function and follows normal function
> register usage.
Yes.  The issue here is expand_call doesn't appear to be aware that 
loading the
address of a __thread variable may require a call.  Thus, it just emits 
an insn to
load r26.  This load is dead because r26 is reloaded for the call to 
__tls_get_addr.

The first argument for the call needs to be saved to a temp, and then 
r26 needs
to be loaded just before the actual call.  This is works fine for normal 
calls.
>
> Why does __tls_get_addr need to be a special function?
>
> Almost all the targets in glibc-ports have C versions of __tls_get_addr.
>
> For example I notice that on Alpha the call to __tls_get_addr is *not*
> done via a emit_library_call_value, instead they use some emit_insn,
> emit_libcall_block and use_reg.
use_reg won't help.  This is attached to the call insn and only comes 
into play
during register allocation.  The problem occurs during rtl expansion.
>
> So it looks like they tamper with the register usage via use_reg
> before the call to __tls_get_addr?
>
> Another example is Sparc which also uses a custom sequence and
> manipulates the used registers.
sparc64 tls support is also broken...  See,
http://www.loria.fr/~zimmerma/software/compilerbugs.html

>
> I think our legitimize_tls_address needs to be rewritten to match
> something like what alpha or sparc has, otherwise we are going to run
> into trouble trying to get emit_library_call_value to work correctly.
>
>

Dave

-- 
John David Anglin    dave.anglin@bell.net

