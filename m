Return-Path: <dub@latnet.lv>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.13])
	by dsl2.external.hp.com (Postfix) with SMTP id F16D14843
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 19 Feb 2004 02:33:09 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1077183184.403482d04a190@clients.latnet.lv>
Date: Thu, 19 Feb 2004 11:33:04 +0200 (EET)
From: dub@latnet.lv
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] Re: can't compile 2.4.24: pdc_cons.o problem! 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Matthew Wilcox willy at debian.org  wrote:

>> I'm trying to compile a new kernel for K210. I tried both stable 2.4.24 and
>>2.4.23
>> (got them by "apt-get -t stable kernel-source-2.4.2x")

> the problem you're having is that you're trying to compile a kernel
> that really doesn't support parisc.  i suggest either getting the
> latest CVS kernel (see http://www.parisc-linux.org/faq/cvs.html) or
> kernel-patch-2.4.21-hppa from the debian archive.

Thanks a lot, it works. :-) BTW, it's not possible to navigate to
http://cvs.parisc-linux.org/download/ from  http://cvs.parisc-linux.org/

One more question. How to find out status of pasisc-linux.org kernels? (stable
vs testing)

BR,
Dub
