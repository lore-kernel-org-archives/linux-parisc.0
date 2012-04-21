From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Boot failure with 32bit kernel
Date: Sat, 21 Apr 2012 17:43:38 -0400
Message-ID: <BLU0-SMTP851712EFA6813BF1C68EB597230@phx.gbl>
References: <20120419102608.1834003e@driller.lan> <BLU0-SMTP37FD4247EEDA51AB13F63E97230@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP37FD4247EEDA51AB13F63E97230@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 21-Apr-12, at 3:15 PM, John David Anglin wrote:

> It would appear the linker has messed up the ALIGN(16), but it
> isn't clear why.  If you look at the kernel with objdump, I would
> expect zeros from 10100000 to 10100100, but maybe something
> else is there.
>
> I don't think this is directly related to the size of the kernel.


As usual, I'm wrong ;(

The problem is kernel size related.

Disassembly of section .text:

10100000 <stext-0x100>:
10100000:       20 2e b2 02     ldil L%1019d800,r1
10100004:       e0 20 2c 7a     be,n 63c(sr4,r1)
...

We have a bunch of long branch stubs at the beginning of the kernel.

Dave
--
John David Anglin	dave.anglin@bell.net



