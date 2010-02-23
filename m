From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: PCI patch breaks boot on rp2470 (2xPA8700)
Date: Tue, 23 Feb 2010 07:56:23 -0500
Message-ID: <119aab441002230456v12891012y85ca6ffc3ba8c0b5@mail.gmail.com>
References: <119aab441002221525m4595b37w875891cd8f95e633@mail.gmail.com>
	 <da824cf31002221654if698808i88709293223b5cd3@mail.gmail.com>
	 <20100223014958.GI16620@ihatethathostname.lab.bos.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Grant Grundler <grundler@google.com>,
	Kyle McMartin <kyle@redhat.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Matthew Wilcox <matthew@wil.cx>
To: Kyle McMartin <kmcmartin@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100223014958.GI16620@ihatethathostname.lab.bos.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 22, 2010 at 8:49 PM, Kyle McMartin <kmcmartin@redhat.com> w=
rote:
> On Mon, Feb 22, 2010 at 04:54:33PM -0800, Grant Grundler wrote:
>> In any case, your patch looks good to me. Please add:
>> =A0 =A0Reviewed-by: Grant Grundler <grundler@google.com>
>
> Your analysis looks correct to me, based on a quick grep.

I agree. Thanks Grant.

I booted a broken kernel and it reports:
~~~
PCI: CLS 0 bytes, default 64
~~~
Which is exactly the case mentioned here:
http://patchwork.kernel.org/patch/69755/

> Applied, thanks Carlos.

You're welcome!

I'm building directly from here:
git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git

Is this correct? My assumption is that you keep this branch up to date
as you pull/test for parisc?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
