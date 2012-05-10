From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 0/5] PA-RISC: fix compile
Date: Thu, 10 May 2012 15:23:37 -0700
Message-ID: <CA+55aFwWrkmqFPW=hOPCiNDE9CGXrwk85W7-vt2Aeg5EC1MtJQ@mail.gmail.com>
References: <4430485.xEvkeJU8MB@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4430485.xEvkeJU8MB@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 10, 2012 at 1:50 PM, Rolf Eike Beer <eike-kernel@sf-tec.de>=
 wrote:
>
> =A0arch/parisc/include/asm/hardware.h | =A0 =A03 ++-
> =A0arch/parisc/include/asm/page.h =A0 =A0 | =A0 =A06 ++++++
> =A0arch/parisc/include/asm/pdc.h =A0 =A0 =A0| =A0 =A07 -------
> =A0arch/parisc/include/asm/pgtable.h =A0| =A0 =A02 ++
> =A0arch/parisc/include/asm/spinlock.h | =A0 =A02 ++
> =A0arch/parisc/kernel/pdc_cons.c =A0 =A0 =A0| =A0 =A01 +
> =A0arch/parisc/kernel/time.c =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0drivers/parisc/sba_iommu.c =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0drivers/video/console/sticore.c =A0 =A0| =A0 =A02 ++
> =A0include/asm-generic/getorder.h =A0 =A0 | =A0 =A02 +-
> =A010 files changed, 18 insertions(+), 9 deletions(-)

The diffstat doesn't match the actual patches - there are no getorder.h=
 changes.

Hmm?

                  Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
