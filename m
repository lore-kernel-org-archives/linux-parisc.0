Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB6984863
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Jul 2002 13:02:59 -0600 (MDT)
Subject: Re: [parisc-linux] Solved: C110, kernel Panics, still more tears ;-(
From: Ryan Bradetich <rbradetich@uswest.net>
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3D3A8209.DCAC18F7@ruhr-west.de>
References: <3D383969.1657EF43@ruhr-west.de>
	<20020720152919.9D690483D@dsl2.external.hp.com>
	<3D3A8209.DCAC18F7@ruhr-west.de>
Content-Type: text/plain
Date: 21 Jul 2002 13:02:58 -0600
Message-Id: <1027278178.28933.25.camel@beavis>
Mime-Version: 1.0
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

> I use a setting of 2 now and was able to ftp a good collection of
> kernel.tar.gz files without crash. I hope this darn baby is *not*
> playing tricks on me now, since I was once able to ftp a 200 MB file
> without crash too. But all left to do is wait and watch and declare it
> fixed for the time beeing.

Glad to see you got this working.  I am not sure if the statistics are
still good (need to look into this again) ... but you could probably 
get a feel of size by checking out /proc/bus/runway/ccio to see how much
of the IO PDIR you are using.

- Ryan
