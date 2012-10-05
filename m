From: John David Anglin <dave.anglin@bell.net>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 5 Oct 2012 18:54:02 -0400
Message-ID: <BLU0-SMTP36BD50597936314A689A99978B0@phx.gbl>
References: <20121004045150.GH23473@ZenIV.linux.org.uk> <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com> <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com> <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com> <20121005144819.GO23473@ZenIV.linux.org.uk>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121005144819.GO23473@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 5-Oct-12, at 10:48 AM, Al Viro wrote:

> What are you using for toolchain, BTW?  With gcc 4.3 / binutils 2.20
> (cross-builds) I'm getting panics from mainline kernel on parisc32 all
> way back to 2.6.28...


Current debian unstable tools are available in shirka.esiee.fr:/home/ 
dave/archives
and shirka.esiee.fr:/home/dave/archives-new.  It's pretty straight  
forward to update
binutils, gcc, libc, etc.

gcc 4.4, 4.5, 4.6 and 4.7 are available.  In particular, 4.6 and 4.7  
have significant
bug fixes.

James seems to have an account on shirka.

I don't have any place to distribute the debs that are on shirka, or  
the time to remove
obsolete builds.  Any volunteers?

Dave
--
John David Anglin	dave.anglin@bell.net



