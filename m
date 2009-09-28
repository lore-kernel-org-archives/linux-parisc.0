From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: rename parisc's vmalloc_start to
	parisc_vmalloc_start
Date: Sun, 27 Sep 2009 23:28:06 -0400
Message-ID: <20090928032806.GM11961@bombadil.infradead.org>
References: <4ABFD97F.7020004@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4ABFD97F.7020004@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Sep 27, 2009 at 11:30:39PM +0200, Helge Deller wrote:
> building kernel 2.6.32(pre), gives this compiler warning:
> /linus-linux-2.6/mm/vmalloc.c: In function 'pcpu_get_vm_areas':
> /linus-linux-2.6/mm/vmalloc.c:2104: warning: 'vmalloc_start' is used uninitialized in this function
>
> The reason is, that the code in mm/vmalloc defines a local variable called
> vmalloc_start, which is already defined as global variable in parisc's code.
>
> To avoid this kind of problems in future, I suggest to rename the parisc variable
> to parisc_vmalloc_start.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

applied.
