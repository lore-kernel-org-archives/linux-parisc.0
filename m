Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA13039
	for <parisc-linux@puffin.external.hp.com>; Sat, 5 Aug 2000 10:03:14 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 5 Aug 2000 16:05:24 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 5 Aug 2000 16:05:07 -0000
Date: Sat, 5 Aug 2000 10:59:58 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Keith Owens <kaos@ocs.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [RFC] 2.4.0-test6-pre2 Merge softirq, local_irq_count, local_bh_count
Message-ID: <20000805105958.T24940@vodka.thepuffingroup.com>
References: <20000804102808.M24940@vodka.thepuffingroup.com> <29149.965463596@ocs3.ocs-net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <29149.965463596@ocs3.ocs-net>; from Keith Owens on Sat, Aug 05, 2000 at 06:19:56PM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Aug 05, 2000 at 06:19:56PM +1000, Keith Owens wrote:
> Linus rolled the change into 2.4.0-test6-pre4.  Do you want a hand
> patching parisc?  I would need a copy of include/asm-parisc and
> arch/parisc.

thanks for the offer, but we'll do it ourselves when we do the next
merge of Linus' tree into our own (we're still on 2.3.99pre8).

-- 
Revolutions do not require corporate support.
