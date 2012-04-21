From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Boot failure with 32bit kernel
Date: Sat, 21 Apr 2012 15:15:10 -0400
Message-ID: <BLU0-SMTP37FD4247EEDA51AB13F63E97230@phx.gbl>
References: <20120419102608.1834003e@driller.lan>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120419102608.1834003e@driller.lan>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 19-Apr-12, at 4:26 AM, Guy Martin wrote:

> The same from the non working 3.3.1 one :
> 10100000 A _text
> 10100100 T _stext
> 10100100 T stext


It seems to me that _stext should be at the same address as _text.
_stext/stext are in __HEAD.  It is

./include/linux/init.h:#define __HEAD		.section	".head.text","ax"
./include/asm-generic/vmlinux.lds.h:#define HEAD_TEXT  *(.head.text)

We have the following in head.S:

         __HEAD

         .align  4
         .import init_thread_union,data
         .import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
#ifndef CONFIG_64BIT
         .import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
         .import $global$                /* forward declaration */
#endif /*!CONFIG_64BIT*/
         .export _stext,data             /* Kernel want it this way! */
_stext:
ENTRY(stext)
         .proc
         .callinfo

         /* Make sure sr4-sr7 are set to zero for the kernel address  
space */
         mtsp    %r0,%sr4

and the following in vmlinux.lds.S:

SECTIONS
{
         . = KERNEL_BINARY_TEXT_START;

         _text = .;              /* Text and read-only data */
         .text ALIGN(16) : {
                 HEAD_TEXT
                 TEXT_TEXT

It would appear the linker has messed up the ALIGN(16), but it
isn't clear why.  If you look at the kernel with objdump, I would
expect zeros from 10100000 to 10100100, but maybe something
else is there.

I don't think this is directly related to the size of the kernel.

I vaguely recall seeing this before.

Dave
--
John David Anglin	dave.anglin@bell.net



