From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: remove _STK_LIM_MAX override
Date: Sun, 27 Apr 2014 18:41:59 -0400
Message-ID: <CAE2sS1hW+E9sqoAfrKftzCeXXWXXZntKjTqsPt4KQOi7jyZ=Kw@mail.gmail.com>
References: <BLU0-SMTP61D9E1AAC7E9DE17FA604F97440@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP61D9E1AAC7E9DE17FA604F97440@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 27, 2014 at 4:20 PM, John David Anglin <dave.anglin@bell.net> wrote:
> The attached change implements the default behavior used by the majority of
> architectures.
>
> Signed-off-by: John David Anglin <dave.anglin@bell.net>

Reviewed-by: Carlos O'Donell <carlos@systemhalted.org>

I have reviewed the kernel code to make sure this does what's intended
and I've reviewed the userpace NPTL implementation to verify that the
new infinity value correctly causes the desired semantics e.g. use of
a sensible default.

This will cause threads using the max stack to have their stack
decreased from 80 MB to 8 MB, but 80 MB was never the correct value to
use anyway and is the cause of userspace failures to create more
threads.

Cheers,
Carlos.
