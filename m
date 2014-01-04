From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] fix crash when using XFS on loopback
Date: Sat, 4 Jan 2014 13:48:19 -0500
Message-ID: <BLU0-SMTP390C5C965F9A4FB18F1EBE97B50@phx.gbl>
References: <alpine.LRH.2.02.1401041241590.4648@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andi Kleen <ak@linux.intel.com>,
	Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@iki.fi>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1401041241590.4648@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 4-Jan-14, at 12:45 PM, Mikulas Patocka wrote:

> * flush_dcache_page asks for the list of userspace mappings, however  
> that
>  page->mapping field is reused by the slab subsystem for a different
>  purpose. This causes the crash.

I'd noticed the other day that the parisc implementation of  
flush_dcache_page()
should return if "!mapping || mapping != page->mapping" is true.  This  
would
have avoided crash.

Dave
--
John David Anglin	dave.anglin@bell.net



