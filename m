From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.10-rc2-pa2 build failing
Date: Sat, 4 Dec 2004 12:02:01 -0700
Message-ID: <20041204190201.GC30126@colo.lackof.org>
References: <Pine.LNX.4.58.0412031551120.3169@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: rray@tcmail.mstc.state.ms.us
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0412031551120.3169@rray.drdc.mstc.ms.gov>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 03, 2004 at 03:55:54PM -0600, rray@tcmail.mstc.state.ms.us wrote:
> I got cvs.parisc-linux.org/download/linux-2.6/linux-2.6.10-rc2-pa2.tar.bz2
> and attempted to compile it with standard options set.

Sorry - I need a better definition of "standard" options.
Can you point at a specific .config file?
Perhaps one of those used by the autobuilder?

(See http://cvs.parisc-linux.org/download/linux-2.6/)

> It fails with
> 
> drivers/built-in.o: In function `sti_select_fbfont':
> drivers/built-in.o(.init.text+0x2eb4): undefined reference to `find_font'
> drivers/built-in.o(.init.text+0x2fd4): undefined reference to `get_default_font'
> make: *** [.tmp_vmlinux1] Error 1
> 
> I'm building this on a K200.
> Any suggestions?

I suspect a dependency is missing in the Kconfig file.
Can you enable CONFIG_VT and see if that fixes the problem?

See drivers/video/Makefile - it only builds drivers/video/console/fonts.c
if CONFIG_VT is enabled. Ergo CONFIG_FB_STI depends on CONFIG_VT
but that's not encoded in drivers/video/Kconfig:
config FB_STI
        tristate "HP STI frame buffer device support"
        depends on FB && PARISC
        default y
...

Hrm...Looking at drivers/video/console/Kconfig it seems
enabling CONFIG_FRAMEBUFFER_CONSOLE is also required.
Please verify that is also enabled.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
