Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA06607
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 12:57:24 -0700
Sender: Jes.Sorensen@cern.ch
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc and ptrace
References: <20001219182257.O7166@linuxcare.com>
From: Jes Sorensen <jes@linuxcare.com>
Date: 19 Dec 2000 20:59:49 +0100
In-Reply-To: Richard Hirst's message of "Tue, 19 Dec 2000 18:22:57 +0000"
Message-ID: <d366kg5gi2.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Richard" == Richard Hirst <rhirst@linuxcare.com> writes:

Richard> So, should I be fixing glibc (if removing that line is indeed
Richard> a fix), or should I be fixing our kernel source so the glibc
Richard> wrapper isn't needed?  ia64, for example seems to fix it in
Richard> the kernel, while sparc64 looks like it uses the glibc
Richard> wrapper.

I'd say fix it in the kernel if it's cheaper to do so. You can stick a
wrapper in glibc as well, but it sounds to be simpler to do in the
kernel.

Jes
