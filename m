Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id F31F148BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 12:39:17 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Compile problem with 2.4.6-pa2
Date: Sun, 14 Mar 2004 20:39:15 +0100
References: <20040313153501.GK9104@finlandia.infodrom.north.de>
In-Reply-To: <20040313153501.GK9104@finlandia.infodrom.north.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403142039.15418.deller@gmx.de>
Cc: Martin Schulze <joey@infodrom.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Martin,

Patch applied.

Thanks,
Helge

On Saturday 13 March 2004 16:35, Martin Schulze wrote:
> Hi,
> 
> there seems to be a dependency missing in Linux 2.6.4-pa2.
> 
> When I try to compile it and have STI_CONSOLE set to 'y', hence
> sticore.c gets compiled, but accidently not setting
> FRAMEBUFFER_CONSOLE to 'y' as well, kernel build ends in a link error
> due to undefined symbols: find_font() called from sti_select_fbfont()
> and another one I forgot to secure.
> 
> Investigation showed that the source of the problem is in
> drivers/video/console/sticore.c:
> 
> koulutie!joey(pts/1):~/linux-2.6.4-pa2/drivers> find -name '*.c'|xargs grep sti_select_fbfont
> ./video/console/sticore.c:sti_select_fbfont( struct sti_cooked_rom *cooked_rom, char *fbfont_name )
> ./video/console/sticore.c:sti_select_fbfont(struct sti_cooked_rom *cooked_rom, char *fbfont_name)
> ./video/console/sticore.c:      if ((font = sti_select_fbfont(rom, font_name[index])))
> 
> And the missing function is defined in drivers/video/console/fonts.c:
> 
> koulutie!joey(pts/1):~/linux-2.6.4-pa2/drivers> find -name '*.c'|xargs grep find_font
> [..]
> ./video/console/fonts.c: *      find_font - find a font
> ./video/console/fonts.c:struct font_desc *find_font(char *name)
> ./video/console/fonts.c:EXPORT_SYMBOL(find_font);
> [..]
> 
> >From reading the help text of STI_CONSOLE, FRAMEBUFFER_CONSOLE and
> FONTS I'm not sure STI_CONSOLE should depend on FONTS, though, but it
> seems to use a function from fonts.c, which should be linked into
> built-in.o
> 
> Adding it fixed the problem, though.
> 
> --- linux-2.6.4-pa2/drivers/video/console/Kconfig.orig	Sat Mar 13 16:17:27 2004
> +++ linux-2.6.4-pa2/drivers/video/console/Kconfig	Sat Mar 13 16:23:30 2004
> @@ -67,7 +67,7 @@
>  #  bool 'IODC console' CONFIG_IODC_CONSOLE
>  config STI_CONSOLE
>          tristate "STI text console" 
> -        depends on PARISC
> +        depends on PARISC && FRAMEBUFFER_CONSOLE
>          default y
>          help
>            The STI console is the builtin display/keyboard on HP-PARISC
> 
> Regards,
> 
> 	Joey
> 
> -- 
> All language designers are arrogant.  Goes with the territory...
> 	-- Larry Wall
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
