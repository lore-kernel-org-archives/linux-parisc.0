From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v2] guard page for stacks that grow upwards
Date: Tue, 24 Aug 2010 20:32:48 +0000
Message-ID: <1282681968.2993.109.camel@mulgrave.site>
References: <4c7413025613b269c@agluck-desktop.sc.intel.com>
	 <AANLkTinMbTu6H9m70sapfpGHC4secUsaUqZKkg_=CWA6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: "Luck, Tony" <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-ia64@vger.kernel.org,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Kyle McMartin <kyle@parisc-linux.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <AANLkTinMbTu6H9m70sapfpGHC4secUsaUqZKkg_=CWA6@mail.gmail.com>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2010-08-24 at 13:19 -0700, Linus Torvalds wrote:
> On Tue, Aug 24, 2010 at 11:44 AM, Luck, Tony <tony.luck@intel.com> wrote:
> >
> > Built, booted & tested on ia64
> > Built for x86_64 (but not booted or tested)
> > pa-risc - untested
> 
> Ok, applied. I do think we could do the "VM_GROWSDOWN = 0" trick for
> PA-RISC  (so that the code for the growsdown case would be compiled
> away there), but that definitely needs somebody who actually cares
> specifically about PA-RISC.

I can try it ... I was just getting ready to try the -rc2 kernel on our
cupertino test ring anyway.

James


