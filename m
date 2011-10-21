From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Fri, 21 Oct 2011 14:11:20 -0400
Message-ID: <4EA1B5C8.7050301@bell.net>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <20111017152358.GA3518@glitch> <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com> <4E9C6F9E.5000605@bell.net> <BLU0-SMTP701E485C5A8DBAF113D35E97EB0@phx.gbl> <CADZpyizJx5fHwv5aHqoN-u1D95ph6dw8S+cAHKRS=MR6Y0WaPQ@mail.gmail.com> <4EA1AF18.9010605@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4EA1AF18.9010605@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/21/2011 1:42 PM, John David Anglin wrote:
> Yes.  The issue here is expand_call doesn't appear to be aware that 
> loading the
> address of a __thread variable may require a call.  Thus, it just 
> emits an insn to
> load r26.  This load is dead because r26 is reloaded for the call to 
> __tls_get_addr.
It appears this may be caused by treating TLS symbols as legitimate 
constants.

Dave

-- 
John David Anglin    dave.anglin@bell.net

