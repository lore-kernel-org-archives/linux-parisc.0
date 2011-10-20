From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Wed, 19 Oct 2011 21:47:26 -0400
Message-ID: <BLU0-SMTP701E485C5A8DBAF113D35E97EB0@phx.gbl>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <20111017152358.GA3518@glitch> <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com> <4E9C6F9E.5000605@bell.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E9C6F9E.5000605@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17-Oct-11, at 2:10 PM, John David Anglin wrote:

>>
>> The cancellation issues happen in tst-cancel*.
>>
>> I believe the cancellation issues are toolchain issues and I need to
>> look into them.
> Possibly, this is related to the following bug that I found last  
> week building mpfr-3.1.0:
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50691
> A call to __tls_get_addr clobbers first argument of call to  
> mpfr_cache.  Don't have a
> fix at the moment, but there is a simple testcase.

I looked at this a bit.  The problem is legitimize_tls_address doesn't  
work properly.
First, GCC doesn't know that the libcall needs r26 and ret0 when the  
__thread variable
is an argument to a call.  Secondly, the implementation of  
__tls_get_addr clobbers
some other call clobbered registers.  I'm thinking the glibc  
implementation might need to
be in assembly language so that the clobbered registers are limited  
(i.e., it needs to
save registers).   This all seems really ugly...

The issues occur in generating PIC code.

Thoughts?

Dave
--
John David Anglin	dave.anglin@bell.net



