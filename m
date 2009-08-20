From: Roland McGrath <roland@redhat.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Thu, 20 Aug 2009 15:07:39 -0700 (PDT)
Message-ID: <20090820220739.F2E554730F@magilla.sf.frob.com>
References: <20090820185550.979544E7A@hiauly1.hia.nrc.ca>
	<4A8DC3ED.4060005@gmx.de>
	<1250805049.4302.121.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave.anglin@nrc.ca
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: James Bottomley's message of  Thursday, 20 August 2009 15:50:49 -0600 <1250805049.4302.121.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Since this is a relinked object, might it be possible that ld rather
> than gcc is the culprit?

I don't think ld -r does any of that sort of magic.

Thanks,
Roland
