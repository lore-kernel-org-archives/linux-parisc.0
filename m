From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Re: [PATCH] Fix the atomic compare and swap
	function on hppa
Date: Tue, 22 May 2007 11:37:23 -0400
Message-ID: <20070522153723.GC16717__1622.58685236356$1416624361$gmane$org@fattire.cabal.ca>
References: <20070520015215.GA26949@amd64.aurel32.net>
	<20070520015653.GA22224@amd64.aurel32.net>
	<119aab440705200822vcfe3dd2ud542783a4ac2c3c8@mail.gmail.com>
	<4652C3EF.3020905@aurel32.net>
	<119aab440705220705s13c5fa96yd27857e22afbd2bd@mail.gmail.com>
	<20070522151930.GA16377@farad.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: libc-ports@sourceware.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070522151930.GA16377@farad.aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 22, 2007 at 05:19:30PM +0200, Aurelien Jarno wrote:
> As discussed on IRC, there is actually a bug in the kernel:
> 
>   #define ENABLE_LWS_DEBUG 0
>   ...
>   # ifdef ENABLE_LWS_DEBUG
> 

Patch to switch #ifdef to #if $x == 1 or the #define to #undef welcome.

> ENABLE_LWS_DEBUG is defined as 0, so the debug code is enabled.
> 
> Please find below a patch which fixes the -EAGAIN problem by harcoding
> the value directly into the code. It also adds a workaround for unfixed
> kernels which return -EDEADLOCK.
> 
> +/* The only basic operation needed is compare and exchange.
> +   -11 corresponds to -EAGAIN, and -45 to -EDEADLOCK. The constants
> +   must stay the same to avoid breaking backwards compatibility.
> +
> +   The check for -EDEADLOCK workarounds a kernel bug (debugging code
> +   enabled by default). */

This is stupid. Why not just use the symbol and then #undef it
immediately afterwards? For extra paranoia name it LWS_RET_EAGAIN or
something.

Putting magic numbers in the code is irritating and makes it more
difficult to read it on a glance.

Regards,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
