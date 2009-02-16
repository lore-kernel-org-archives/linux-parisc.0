From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] parisc: fixup cpu_check_affinity for const cpumask *dest
Date: Mon, 16 Feb 2009 18:00:25 +1030
Message-ID: <200902161800.26263.rusty@rustcorp.com.au>
References: <20090214082219.GA17304@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-parisc@vger.kernel.org, grundler@parisc-linux.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090214082219.GA17304@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Saturday 14 February 2009 18:52:19 Kyle McMartin wrote:
> Noticed a new build warning... poking at it a bit, and lo' and behold
> it was a patch that never hit the list or my email...

Hmm, it got a Reviewed-by: line from Grant, but maybe I missed the list?

But fix looks reasonable (I obviously missed that check_cpu_affinity did
more than check...).

Thanks,
Rusty.
