Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA01506
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 10:38:07 -0600
To: Richard Hirst <rhirst@linuxcare.com>
Cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0-test6 lack of speed 
In-Reply-To: Your message of "Wed, 23 Aug 2000 17:23:20 BST."
             <20000823172320.E4060@linuxcare.com>
References: <20000822153803.U4060@linuxcare.com> <20000822155221.W4060@linuxcare.com> <20000822165047.X4060@linuxcare.com> <87n1i5wabx.fsf@linuxcare.com>  <20000823172320.E4060@linuxcare.com> 
Date: Wed, 23 Aug 2000 10:38:13 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13RdXZ-0003Lz-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


jsm explained to me that the F?CE and P?TLBE instructions should
only be used "for flushing the entire data or combined cache".
The operands of F?CE/P?TLBE are "an implementation-dependent function
of the effective address", essentially an opaque data type that
varies per processor.  The operand of F?C/P?TLB is a virtual address,
so is the right thing to use for flushing a range of addresses.

	-P
