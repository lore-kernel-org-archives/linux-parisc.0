From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [parisc-linux] [PATCH] Use the new sg_page() helper
Date: Tue, 23 Oct 2007 10:00:22 -0700 (PDT)
Message-ID: <alpine.LFD.0.999.0710230956330.30120__32876.0118726224$1416624448$gmane$org@woody.linux-foundation.org>
References: <1193156092-11819-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: axboe@kernel.dk,
 chris@zankel.net,
 linux-kernel@vger.kernel.org,
 anil.s.keshavamurthy@intel.com,
 linuxppc-dev@ozlabs.org,
 paulus@samba.org,
 shaohua.li@intel.com,
 linux-arm-kernel@lists.arm.linux.org.uk,
 parisc-linux@lists.parisc-linux.org,
 ashok.raj@intel.com
To: Emil Medve <Emilian.Medve@Freescale.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1193156092-11819-1-git-send-email-Emilian.Medve@Freescale.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



On Tue, 23 Oct 2007, Emil Medve wrote:
>
> Fix build error messages such as this:

Some - but apparently not all - of these are already fixed in my tree, 
through pulls from Jens. I just pushed out the result, can you resend the 
parts that didn't already get fixed?

As is, the patch won't apply for me, since it touches many different parts 
and some of them are fixed.

		Linus
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
