Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA07561
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 13:17:54 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 19 Dec 2000 20:20:50 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 312AEB005; Tue, 19 Dec 2000 20:14:46 +0000 (GMT)
Date: Tue, 19 Dec 2000 20:14:46 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jes Sorensen <jes@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc and ptrace
Message-ID: <20001219201446.B2554@linuxcare.com>
References: <20001219182257.O7166@linuxcare.com> <d366kg5gi2.fsf@lxplus015.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d366kg5gi2.fsf@lxplus015.cern.ch>; from jes@linuxcare.com on Tue, Dec 19, 2000 at 08:59:49PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Dec 19, 2000 at 08:59:49PM +0100, Jes Sorensen wrote:
> >>>>> "Richard" == Richard Hirst <rhirst@linuxcare.com> writes:
> 
> Richard> So, should I be fixing glibc (if removing that line is indeed
> Richard> a fix), or should I be fixing our kernel source so the glibc
> Richard> wrapper isn't needed?  ia64, for example seems to fix it in
> Richard> the kernel, while sparc64 looks like it uses the glibc
> Richard> wrapper.
> 
> I'd say fix it in the kernel if it's cheaper to do so. You can stick a
> wrapper in glibc as well, but it sounds to be simpler to do in the
> kernel.

Kernel fix does seem more sensible, I just wonder if there is
a general move towards doing it one way rather than the other.

Richard
