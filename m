Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BF03482D
	for <parisc-linux@parisc-linux.org>; Sun,  7 Oct 2001 17:31:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15qNOd-0007DS-00; Mon, 08 Oct 2001 00:31:47 +0100
Date: Mon, 8 Oct 2001 00:31:47 +0100
From: Matthew Wilcox <willy@debian.org>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Second Draft of the help for the kernel options
Message-ID: <20011008003147.A6105@parcelfarce.linux.theplanet.co.uk>
References: <3BB8F957.C9811C25@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BB8F957.C9811C25@esiee.fr>; from marteaut@esiee.fr on Tue, Oct 02, 2001 at 01:16:39AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 02, 2001 at 01:16:39AM +0200, Thomas Marteau wrote:
> Processor family
> CONFIG_PA7100
>   In this section, you will find enough informations to set correctly 
>   your CPU type option. Nevertheless, if you need more, you can see 
>   all the hardware content of your box at http://hwdb.parisc-linux.org.
>   
>   If you select the PA7000/PA7100 option, your box must be one of these 
>   listed below: 705/35, 710/50, 715/33, 715/50, 715/75, 720/50, 725/50, 
>   725/75, 730/66, 735/99, 735/125, 750/66, 755/99.
> 
>   If you select the PA7200 option, your box must be one of these listed 
>   below: C100, C110, D250, D350, D260, D360, J200, J210, K100, K200, 
>   K210, K220, K400, K410, K420.
> 
>   If you choose the PA7100LC/PA7300LC option then your box is 715/64, 
>   715/80, 715/100, 725/100, A180, B132L(+), B160L(+), B180L(+), C160L, 
>   C180L, D200, D210, D220, D230, D300, D310, D320 or D330. There are 
>   also some systems from the E series but there are not yet supported.
> 
>   Finally, PA8x00 is the good choice for all new stuff like A500, B1000,
>   B2000, B2600, C200+, C240+, C3000, C3600, J282, J2240, J5000, J6000, 
>   J6700, J7000, K250, K260, K270, K370, K450, K460, K470, K570, L1000, 
>   L2000, L3000, N4000, V2200, V2250, V2500.
> 
>   Now, you should be sure of which CPU type. If not, please send a mail 
>   to parisc-linux@lists.parisc-linux.org.

Let's try this in the style of the x86 one:

Processor family
CONFIG_PA7100
  This is the processor type of your CPU. This information is used for
  optimizing purposes. In order to compile a kernel that can run on
  all 32-bit PA-RISC processors, you can specify PA7000 here.  If you
  have a 64-bit machine, you may need to select PA8x00 here and say
  'y' to '64-bit kernel' below.

  The kernel will not necessarily run on earlier architectures than
  the one you have chosen, e.g. a PA7200 optimised kernel will run on
  a PA8000 cpu, but not a PA7000.

  If you don't know what type of CPU you have, you can refer to the
  Hardware Database at http://hwdb.parisc-linux.org/

> 64-bit kernel
> CONFIG_PARISC64
>   The 64-bit kernel support give the capability of using 64-bit CPU to 
>   the kernel. This is useful for PA8X00 series minimum. Note that even
>   if your kernel is 64-bit, your userspace will be in 32-bit.

64-bit kernel
CONFIG_PARISC64
  Selecting this option will build a 64-bit kernel.  Some 64-bit machines
  require a 64-bit kernel (eg L2000, A500) while other machines don't
  have 64-bit firmware (eg C360, J200), so you may need to enable 32-bit
  PDC below if you select this option.  Note that 64-bit userspace is
  not yet supported.

32-bit PDC
CONFIG_PDC_NARROW
  Turning this option on enables support for 32-bit firmware when running
  a 64-bit kernel.  You should select this option if you have a machine
  from the C160-J2240 era.

-- 
Revolutions do not require corporate support.
