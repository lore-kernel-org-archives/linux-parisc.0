Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 8C9FA4843
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  7 Mar 2004 11:02:33 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] include/linux/soundcard.h endian fix
Date: Sun, 7 Mar 2004 19:02:28 +0100
References: <20040222070150.GA773@calypso> <20040223194047.GA448@calypso>
	<20040307173210.GA471@calypso>
In-Reply-To: <20040307173210.GA471@calypso>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200403071902.29292.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 07 March 2004 18:32, Stuart Brady wrote:
> Does anyone have any thoughts regarding this patch?
> 
> Index: soundcard.h
> ===================================================================
> RCS file: /var/cvs/linux-2.4/include/linux/soundcard.h,v
> retrieving revision 1.6
> diff -u -r1.6 soundcard.h
> --- soundcard.h	26 Jun 2003 15:08:08 -0000	1.6
> +++ soundcard.h	21 Feb 2004 16:04:12 -0000
> @@ -179,7 +179,7 @@
>   * Some big endian/little endian handling macros
>   */
>  
> -#if defined(_AIX) || defined(AIX) || defined(sparc) || defined(__sparc__) || defined(HPPA) || defined(PPC) || defined(__mc68000__)
> +#if defined(_AIX) || defined(AIX) || defined(sparc) || defined(__sparc__) || defined(HPPA) || defined(__hppa__) || defined(PPC) || defined(__powerpc__) || defined(__mc68000__)

I think you should just use "defined(__hppa__)" and simply 
drop the "defined(HPPA)" part.

> Or alternatively:
> 
> Index: soundcard.h
> ===================================================================
> RCS file: /var/cvs/linux-2.4/include/linux/soundcard.h,v
> retrieving revision 1.6
> diff -u -r1.6 soundcard.h
> --- soundcard.h	26 Jun 2003 15:08:08 -0000	1.6
> +++ soundcard.h	07 Mar 2004 17:26:23 -0000
> @@ -39,6 +39,13 @@
>  /* In Linux we need to be prepared for cross compiling */
>  #include <linux/ioctl.h>
>  
> +/* Endian macros. Note that they have a different meaning in the kernel. */
> +#ifdef __KERNEL__
> +#  include <asm/byteorder.h>
> +#else
> +#  include <endian.h>
> +#endif
> +
>  /*
>   *	Supported card ID numbers (Should be somewhere else?)
>   */
> @@ -179,13 +186,28 @@
>   * Some big endian/little endian handling macros
>   */
>  
> -#if defined(_AIX) || defined(AIX) || defined(sparc) || defined(__sparc__) || defined(HPPA) || defined(PPC) || defined(__mc68000__)
> -/* Big endian machines */
> -#  define _PATCHKEY(id) (0xfd00|id)
> -#  define AFMT_S16_NE AFMT_S16_BE
> -#else
> -#  define _PATCHKEY(id) ((id<<8)|0xfd)
> -#  define AFMT_S16_NE AFMT_S16_LE
> +#if defined(__BIG_ENDIAN)
> +#  if defined(__KERNEL__) || (defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN)
> +#    if defined(AFMT_S16_NE) || defined(_PATCHKEY)
> +#      error AFMT_S16_NE (or _PATCHKEY) is already defined
> +#    endif
> +#    define AFMT_S16_NE AFMT_S16_BE
> +#    define _PATCHKEY(id) (0xfd00|id)
> +#  endif
> +#endif
> +
> +#if defined(__LITTLE_ENDIAN)
> +#  if defined(__KERNEL__) || (defined(__BYTE_ORDER) && __BYTE_ORDER == __LITTLE_ENDIAN)
> +#    if defined(AFMT_S16_NE) || defined(_PATCHKEY)
> +#      error AFMT_S16_NE (or _PATCHKEY) is already defined
> +#    endif
> +#    define AFMT_S16_NE AFMT_S16_LE
> +#    define _PATCHKEY(id) ((id<<8)|0xfd)
> +#  endif
> +#endif
> +
> +#if !defined(AFMT_S16_NE)
> +#  error Failed to define AFMT_S16_NE
>  #endif
>  
>  /*

Personally I think either is OK.
 
> Should I be sending this elsewhere?

linux-kernel@vger.kernel.org ?

Helge
