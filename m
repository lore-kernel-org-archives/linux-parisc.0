From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] A sti 2.6.16-rc5-pa2 build failure?
Date: Mon, 20 Mar 2006 15:40:06 -0700
Message-ID: <20060320224006.GM8980@parisc-linux.org>
References: <IWFBHA$6574DD99581BECB275DA2287BF1C9843@scarlet.be> <200603201947.08045.deller@gmx.de> <200603202042.40760.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <willy@parisc-linux.org>
In-Reply-To: <200603202042.40760.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Mar 20, 2006 at 08:42:40PM +0100, Helge Deller wrote:
> Hi Joel,
> 
> it builds for me...

It depends on your .config.  If you look at
http://cvs.parisc-linux.org/download/linux-2.6/ you'll see 712_defconfig
fail to build for the last two releases.  I'm testing Joel's fix now.
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                                                               
~                                  
