From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 0/5] section name cleanup for parisc
Date: Sat, 2 May 2009 10:19:53 -0400
Message-ID: <20090502141953.GC28342@bombadil.infradead.org>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sam Ravnborg <sam@ravnborg.org>,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org
To: Tim Abbott <tabbott@MIT.EDU>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 30, 2009 at 07:55:14PM -0400, Tim Abbott wrote:
> This patch series cleans up the section names on the parisc
> architecture.  It requires the architecture-independent macro
> definitions from this patch series:
> 
> <http://www.spinics.net/lists/mips/msg33499.html>
> 
> The long-term goal here is to add support for building the kernel with
> -ffunction-sections -fdata-sections.  This requires renaming all the
> magic section names in the kernel of the form .text.foo, .data.foo,
> .bss.foo, and .rodata.foo to not have collisions with sections
> generated for code like:
> 
> static int nosave = 0; /* -fdata-sections places in .data.nosave */
> static void head(); /* -ffunction-sections places in .text.head */
> 
> Note that these patches have not been boot-tested (aside from testing
> the analogous changes on x86), since I don't have access to the
> appropriate hardware.
> 
> 	-Tim Abbott
> 
> 
> Tim Abbott (5):
>   parisc: use NOSAVE_DATA macro for .data.nosave section.
>   parisc: use new macro for .data.cacheline_aligned section.
>   parisc: use new macros for .data.init_task.
>   parisc: use new macro for .data.read_mostly section.
>   parisc: convert to new generic read_mostly support.
> 

Not sure what the easiest way to merge these will be... I'll apply them
to a section-cleanup branch in the parisc git tree until the
architecture independent portions are upstream.

regards, Kyle
