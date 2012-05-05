From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: 5fbd036b552f633abb394a319f7c62a5c86a9cd7 breaks PA-RISC boot
Date: Sat, 05 May 2012 22:33:26 +0200
Message-ID: <1336250006.2463.139.camel@laptop>
References: <Pine.LNX.4.64.1205042305250.18896@file.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Stepan Moskovchenko <stepanm@codeaurora.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@elte.hu>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205042305250.18896@file.rdu.redhat.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2012-05-04 at 23:26 -0400, Mikulas Patocka wrote:
> Your patch 5fbd036b552f633abb394a319f7c62a5c86a9cd7 breaks PA-RISC boot. I 
> have a dual-core PA-8800. With the patch applied, the kernel crashes with 
> these messages. The timer structures are apparently corrupted, as the 
> timer sees a negative amount of delayed cycles: 

You'll find:

  http://marc.info/?l=linux-parisc&m=133241790810604&w=2

will probably fix the issue.
