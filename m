From: Roland McGrath <roland@redhat.com>
Subject: Re: [parisc-linux] Re: NPTL for hppa-linux is not backwards
	compatible with Linuxthreads.
Date: Fri, 23 Feb 2007 17:56:07 -0800 (PST)
Message-ID: <20070224015607.EC0DC180076__25402.5075737902$1416624311$gmane$org@magilla.sf.frob.com>
References: <119aab440702230839r74de6682ge0619c42d5606caf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-glibc@lists.debian.org,
 libc-ports@sourceware.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: Carlos O'Donell's message of  Friday,
	23 February 2007 11:39:10 -0500
	<119aab440702230839r74de6682ge0619c42d5606caf@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Unfortunatly, due to alignment the NPTL pthread_cond_t grows larger
> than the Linuxthreads version when I add the padding. This is the only
> structure the grows larger in size than before. Is there any way I can
> avoid adding the padding?

It looks to me like you have one word to spare.  That's all you really
need.  That word will only ever be 1 from old PTHREAD_COND_INITIALIZER.
Checking all three padding words is really just paranoia trying to
distinguish clobbered structs from old initialized data.


Thanks,
Roland
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
