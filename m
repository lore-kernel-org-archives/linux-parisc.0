Return-Path: <randolph@tausq.org>
Date: Sat, 27 Mar 2004 16:21:39 -0800
From: Randolph Chung <randolph@tausq.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] asm-parisc/ide.h cleanup (there are no
	standard ports)
Message-ID: <20040328002139.GE750@tausq.org>
References: <200403241443.43206.bzolnier@elka.pw.edu.pl>
	<20040327222810.GB24782@colo.lackof.org>
	<200403280024.57672.bzolnier@elka.pw.edu.pl>
	<20040327234926.GC24782@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040327234926.GC24782@colo.lackof.org>
Cc: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>,
	linux-ide@vger.kernel.org, parisc-linux@parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I was told offline my hypothetical example is in fact hypothetical.
> parisc won't build with IDE unless PCI is defined. I haven't tried.

not exactly. what i meant is, without this patch, if you built pa with
ide enabled but pci disabled you will get a compilation error.

i think this patch looks ok too. will commit to our tree and let willy
propogate upstream :)

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
