Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 15 Aug 2003 11:21:42 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: caslivkoff@speakeasy.net
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: xchat colors (Was Re:  [parisc-linux] xfree86 4.2.1-9 build problem)
Message-ID: <20030815172142.GA19042@dsl2.external.hp.com>
References: <W9958529574305441060899998@webmail4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <W9958529574305441060899998@webmail4>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Aug 14, 2003 at 10:26:38PM +0000, caslivkoff@speakeasy.net wrote:
> Just to be sure this is indeed a colormap issue,

Ok - it's a color map issue.
I added some printf's to xchat-2.0.3/fe-gtk/palette.c:palette_alloc().

I'll see how hard it is to teach xchat to use it's own color map.

grant

grundler <527>xchat
palette_alloc() cmap has 256 colors
palette_alloc() alloc color failed for 21 (0x0 0x0 0xffff)
palette_alloc() alloc color failed for 20 (0x8c8c 0x1010 0x1010)
palette_alloc() alloc color failed for 19 (0x0 0x0 0x0)
palette_alloc() alloc color failed for 18 (0xc866 0xc866 0xc866)
palette_alloc() alloc color failed for 17 (0x0 0x0 0x0)
palette_alloc() alloc color failed for 16 (0xa4a4 0xdfdf 0xffff)
palette_alloc() alloc color failed for 15 (0x9999 0x9999 0x9999)
palette_alloc() alloc color failed for 14 (0x7777 0x7777 0x7777)
palette_alloc() alloc color failed for 13 (0xeeee 0x2222 0xeeee)
palette_alloc() alloc color failed for 12 (0x0 0x0 0xffff)
palette_alloc() alloc color failed for 11 (0x3333 0xeeee 0xffff)
palette_alloc() alloc color failed for 10 (0x0 0xcccc 0xcccc)
palette_alloc() alloc color failed for 9 (0x3333 0xdede 0x5555)
palette_alloc() alloc color failed for 8 (0xeeee 0xdddd 0x2222)
palette_alloc() alloc color failed for 7 (0xffff 0xaaaa 0x0)
palette_alloc() alloc color failed for 6 (0xbbbb 0x0 0xbbbb)
palette_alloc() alloc color failed for 5 (0xaaaa 0x0 0x0)
palette_alloc() alloc color failed for 4 (0xdddd 0x0 0x0)
palette_alloc() alloc color failed for 3 (0x0 0xcccc 0x0)
palette_alloc() alloc color failed for 2 (0x0 0x0 0xcccc)
palette_alloc() alloc color failed for 1 (0x0 0x0 0x0)
palette_alloc() alloc color failed for 0 (0xcf3c 0xcf3c 0xcf3c)
grundler <528>
