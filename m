Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA25631
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Aug 2000 07:47:51 -0600
Received: from user49-45.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.49.45)
  by mailserv2.iuinc.com with SMTP; 24 Aug 2000 13:47:45 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BD4C0B005; Thu, 24 Aug 2000 14:46:17 +0100 (BST)
Date: Thu, 24 Aug 2000 14:46:17 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Paul Bame <bame@noam.fc.hp.com>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed
Message-ID: <20000824144617.K4060@linuxcare.com>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com> <20000823172320.E4060@linuxcare.com> <E13RdXZ-0003Lz-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E13RdXZ-0003Lz-00@noam.fc.hp.com>; from bame@noam.fc.hp.com on Wed, Aug 23, 2000 at 10:38:13AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 23, 2000 at 10:38:13AM -0600, Paul Bame wrote:
> 
> jsm explained to me that the F?CE and P?TLBE instructions should
> only be used "for flushing the entire data or combined cache".
> The operands of F?CE/P?TLBE are "an implementation-dependent function
> of the effective address", essentially an opaque data type that
> varies per processor.  The operand of F?C/P?TLB is a virtual address,
> so is the right thing to use for flushing a range of addresses.

OK, thanks.  We use F?CE/P?TLBE in cache.h atm.

Richard
