Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F2144A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Mar 2001 23:54:21 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14fyz8-0001PV-00; Thu, 22 Mar 2001 06:54:14 +0000
Date: Thu, 22 Mar 2001 06:54:14 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: rbradetich@uswest.net
Cc: parisc-linux@parisc-linux.org
Message-ID: <20010322065414.R5491@parcelfarce.linux.theplanet.co.uk>
References: <20010321234622.A15809@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010321234622.A15809@beavis.ybsoft.com>; from rbrad@beavis.ybsoft.com on Wed, Mar 21, 2001 at 11:46:22PM -0700
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: [parisc-linux-cvs] [PATCH] PDC Wrappers for 32-bit firmware using 64-bit kernels
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 21, 2001 at 11:46:22PM -0700, Ryan Bradetich wrote:
> Index: arch/parisc/config.in
> ===================================================================
> RCS file: /home/cvs/parisc/linux/arch/parisc/config.in,v
> retrieving revision 1.33
> diff -u -p -r1.33 config.in
> --- config.in	2001/03/02 01:41:03	1.33
> +++ config.in	2001/03/22 06:30:14
> @@ -33,6 +33,9 @@ choice 'Processor family' \
>  if [ "$CONFIG_PA8X00" = "y" ] ; then
>     define_bool CONFIG_PA20 y
>     bool '64-bit kernel' CONFIG_PARISC64 n
> +   if [ "$CONFIG_PARISC64" = "y" ] ; then
> +      bool '32-bit PDC' CONFIG_PDC_NARROW n
> +   fi
>  else
>     define_bool CONFIG_PA11 y
>  fi

I object because this patch adds a new CONFIG_ option without an explanation
for it!  (Pot.  Kettle.  Black.)

What happened to all the people who were dying to help with the port
but weren't confident in their programming abilities?  Did we drive them
all away?

-- 
Revolutions do not require corporate support.
