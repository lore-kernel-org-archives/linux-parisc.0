From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] fix crash when using XFS on loopback
Date: Wed, 8 Jan 2014 13:59:30 -0800
Message-ID: <20140108135930.9fc1d3a63eeb9a45dcbbb2e8@linux-foundation.org>
References: <alpine.LRH.2.02.1401041241590.4648@file01.intranet.prod.int.rdu2.redhat.com>
	<20140106073549.GA25771@lge.com>
	<alpine.LRH.2.02.1401061237120.6190@file01.intranet.prod.int.rdu2.redhat.com>
	<20140107014159.GA26726@lge.com>
	<52CDBD94.9090808@gmx.de>
	<CAOJsxLGJbRrDOesdSFnYCt9GOyTGEF0TDWNux06C3OxJnuLFMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Andi Kleen <ak@linux.intel.com>,
	Christoph Lameter <cl@linux.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org
To: Pekka Enberg <penberg@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAOJsxLGJbRrDOesdSFnYCt9GOyTGEF0TDWNux06C3OxJnuLFMg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 8 Jan 2014 23:37:49 +0200 Pekka Enberg <penberg@kernel.org> wrote:

> The patch looks good to me but it probably should go through Andrew's tree.

yup.

page_mapping() will be called quite frequently, and adding a new
test-n-branch in there will be somewhat costly.  We might end up with a
better kernel if we were to instead revert 8456a648cf44f.  How useful
was that patch?
