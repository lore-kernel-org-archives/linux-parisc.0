From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [next:akpm 129/309] net/core/sock.c:274:36: error: initializer
 element is not constant
Date: Tue, 24 Jul 2012 15:48:44 +0800
Message-ID: <20120724074844.GA9519@localhost>
References: <20120722163058.GB13376@localhost>
 <20120723111619.GT9222@suse.de>
 <1343042420.3027.11.camel@dabdike.int.hansenpartnership.com>
 <20120723114258.GV9222@suse.de>
 <20120723122905.GA22476@localhost>
 <BLU0-SMTP2254F8872DDE5FA6035CDE97DD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mel Gorman <mgorman@suse.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	kernel-janitors@vger.kernel.org,
	Kyle McMartin <kyle@parisc-linux.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP2254F8872DDE5FA6035CDE97DD0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> It would be easier to see what's happening with preprocessed source.

Here is the line in sock.i:

struct static_key memalloc_socks = ((struct static_key) { .enabled = ((atomic_t) { (0) }) });

Thanks,
Fengguang
