From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 18:50:35 -0400
Message-ID: <20100622225035.GA13794@hiauly1.hia.nrc.ca>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com> <20100620042814.ECC205160@hiauly1.hia.nrc.ca> <AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com> <AANLkTinFBc9524WWuwrRvuBQGY0OCqjPIZ_t9A7esb-B@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTinFBc9524WWuwrRvuBQGY0OCqjPIZ_t9A7esb-B@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 22 Jun 2010, Carlos O'Donell wrote:

>         /* Return, no need to restore the PIC register. */
> -       ldw     -84(%sp), %rp
> -       bv      %r0(%rp)
> -       ldwm    -64(%sp), %r3
> +       ldw     -20(%sp), %rp
> +       bv,n    %r0(%rp)

For the reasons discussed, I don't believe that %rp should be restored
from the stack.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
