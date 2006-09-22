From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Current allmodconfig failures
Date: Fri, 22 Sep 2006 20:44:03 +0200
Message-ID: <200609222044.03317.deller@gmx.de>
References: <20060921114240.GL2585@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060921114240.GL2585@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 21 September 2006 13:42, Matthew Wilcox wrote:
> $ grep undefined make.err 
> WARNING: "flush_data_cache" [drivers/video/console/sticore.ko] undefined!
> WARNING: "sti_set" [drivers/video/console/sticon.ko] undefined!
> WARNING: "sti_putc" [drivers/video/console/sticon.ko] undefined!
> WARNING: "sti_bmove" [drivers/video/console/sticon.ko] undefined!
> WARNING: "sti_clear" [drivers/video/console/sticon.ko] undefined!
> WARNING: "dummy_con" [drivers/video/console/sticon.ko] undefined!
> WARNING: "conswitchp" [drivers/video/console/sticon.ko] undefined!
> 
> I suspect the flush_data_cache() is a relic from the olden days -- I
> think the flush_icache_range() call should be sufficient.

Yes. flush_kernel_dcache_range() may need to stay as well.

> STI scares me.  

Why ?

> I don't understand why we need the dummy console.  

AFAIK, we need the dummy console, because at the point where other arches initialize their graphics subsystem, we can't do it.
We do it later when all infrastructure is available and then take_over_console().

> I don't know if it makes any sense to build your console as a module. 

Why not ?
Switching from sti console to another one should be possible IMHO.
It's even good when debugging the STI functions.

> I don't know why sticore is in the console directory.

sticore is used by stifb and sticon.
It has more console functions, so IMHO it's OK.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
