Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93FEB482F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Jun 2002 18:01:38 -0600 (MDT)
Date: Mon, 24 Jun 2002 01:01:21 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA8000 modutils problems 
In-Reply-To: <20020622020557.AFB544876@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0206240051550.27933-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 21 Jun 2002, Grant Grundler wrote:

> "M. Grabert" wrote:
> > Later I tried compiling pa39 (32bit), but depmod reported
> > "unhandled relocation of type 74" for each function in each module.
>
> This is a known bug in the modutils package.
>
> Richard Hirst had created an older (hacked 2.4.13) version of
> modutils that can deal with relocation type 74. See
> 	ftp://ftp.parisc-linux.org/unofficial-debs/
>
> and grab modutils-2.4.13-3.1rgh*

Thanks alot! I think I did that earlier, but after an apt-get upgrade
it might have been 'updated'. I set it to 'HOLD' (dselect) next time.

> > Compiling 64bit with the (quite old) unofficial debs worked however,
> > but there are some "unresolved symbols" in a few (=4) modules,
> > each time the symbol is "__xchg64".
>
> grundler <506>fgrep -n __xchg64 arch/parisc/kernel/parisc_ksyms.c
> 77:EXPORT_SYMBOL(__xchg64);
>
> Something else is wrong. you are building from CVS right?
> Try "make distclean" and rebuild the 64-bit vmlinux/ from scratch.

Yes, I always use the CVS trunk. I always have the CVS tree on
a different machine and do a CVS update on it (intel laptop with internet
connection, at work) and then copy the kernel to the parisc-linux machine
(no internet connection, at home). So I always have a fresh, clean CVS
kernel (with no old *.o files).

But I just did a 'make clean' when I decided to make a 64bit. I forgot
that it is actually a different architecture ... This might have caused
the problem!
Thanks for reminding!


greetings max

-- 
I am the "ILOVEGNU" signature virus. Just copy me to your signature.
This email was infected under the terms of the GNU General Public License.
