From: "Paul (NCC/CS)" <pts@bom.gov.au>
Subject: Re: [parisc-linux] almost booted a K420...
Date: Sun, 15 Apr 2007 23:14:50 +1000
Message-ID: <4622254A.6FEDCDDF__18561.7192568772$1416624332$gmane$org@bom.gov.au>
References: <461DA527.8FF91FC1@bom.gov.au>
	<9df6f3ea0704112341y55866aebk73373b75e90686d1@mail.gmail.com>
	<b74751490704120350s162d6140g95622904d2142bca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: ram <talk2ram@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Hi Guys,

I just read your replies.

But before this I did try GENTOO.

wallah! :))))))))))))

works out of the box. ( cd).

i haven't done the full install yet but i'm very pleased
that it boots a kernel.

PS i even tried gentoo on an IBM/RS6000 that i've never
been able to get debian to boot on also. and it worked too!!!:))).
double christmas:).

so gentoo gets my thumbs up at the present.

it's disappointing that debian never comes up with the stuff
on these machines. But never mind.

thanks,
Paul.









ram wrote:

>
>
>      Hi Paul,
>
>      I'm using a K370 with great success. I'm not sure whether
>      the Debian install CD will work on a multi-CPU box.  You can
>      try unplugging all but the first CPU and see if that makes a
>      difference.  Also, you may have to add "console=ttyB0" or
>      somesuch to PALO's boot line -- the K classes (and perhaps
>      a few other boxes) have very different serial hardware.  Oh
>      wait, I see you have it already.
>
>      Sorry this  is a bit vague; I run Gentoo and it was very simple
>      to boot the install CD.  So if you hit a dead-end, you might
>      give it a try.
>
>  Hi some time back i posted the problem, but  some one responded, but i did not solve the problem
> after i saw the new version released, i want to try, but i see the same problem Kernel Panic- not
> syncing:drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping resourcesiam
> using  webconsole and installing any suggestion make my system working with Debian 4.X HP R Class
> 9000, 1GB RAM, Built in CD ROM thanksram

--

____________________________________________

Paul
Australian Bureau Of Meteorology
____________________________________________




"In a world without walls and fences,
who needs windows and gates ?"






_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
