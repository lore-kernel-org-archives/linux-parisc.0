From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/2] Linker script cleanup patches for parisc
Date: Sat, 19 Sep 2009 10:38:15 +0200
Message-ID: <20090919083815.GC25840@merkur.ravnborg.org>
References: <1253306078-7066-1-git-send-email-tabbott@ksplice.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Helge Deller <deller@gmx.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Tim Abbott <tabbott@ksplice.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1253306078-7066-1-git-send-email-tabbott@ksplice.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Sep 18, 2009 at 04:34:36PM -0400, Tim Abbott wrote:
> This is an updated version of the patch series I sent on September 6
> cleaning up the parisc architecture's linker scripts.  It differs from
> the previous version only in having been rebased on top of Linus'
> current master (and is a complete rewrite of the version that got some
> review back in May:
> <http://linux.derkeiler.com/Mailing-Lists/Kernel/2009-05/msg00095.html>).
> 
> This cross-architecture linker script cleanup project is in
> preparation for adding support for building the kernel with
> -ffunction-sections -fdata-sections, which is a prerequisite for
> Ksplice.
> 
> 	-Tim Abbott
> 
> Tim Abbott (2):
>   parisc: Clean up linker script using new linker script macros.
>   parisc: Remove useless altinstructions code copied from x86.

Looks good.

Both have my:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
