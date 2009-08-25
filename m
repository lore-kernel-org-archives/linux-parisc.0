From: Roland McGrath <roland@redhat.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Tue, 25 Aug 2009 12:24:32 -0700 (PDT)
Message-ID: <20090825192432.4D9CC411E3@magilla.sf.frob.com>
References: <4A89CC4D.5040801@gmx.de>
	<20090819013124.7539E4730F@magilla.sf.frob.com>
	<1250645916.18426.12.camel@mulgrave.site>
	<200908251729.32855.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: Rusty Russell's message of  Tuesday, 25 August 2009 17:29:32 +0930 <200908251729.32855.rusty@rustcorp.com.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Actually, x86 was one of the archs which fucked us.  Richard Henderson and
> I *had* this, but ld -shared without -fPIC helpfully tells you "you're doing
> it wrong" on x86-64.

This complaint could easily be (have been) made optional.

> There were other issues, ISTR MIPS was a showstopper.

Richard told me it's all MIPS' fault, but I was being discreet.


Thanks,
Roland
