From: Jochen Friedrich <jochen@scram.de>
Subject: Re: [parisc-linux] 53c700.c problems with tags?
Date: Thu, 2 Sep 2004 12:48:01 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0409021240540.2373@localhost>
References: <Pine.LNX.4.58.0408311232240.2373@localhost>
	<20040902031859.GB24049@colo.lackof.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: parisc <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040902031859.GB24049@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Grant,

> Searching for "tag starvation" at
> 	http://lists.parisc-linux.org/
>
> yields:
> 	http://lists.parisc-linux.org/pipermail/parisc-linux/2004-August/024357.html

Thanks. However, my post was not a question how to get rid of the problem
(my servers are running fine) but just a hint that there might be a bug in
the tag handling code of 53c700.c. I didn't really look at the code hard
enough, but to me it looks like if the tag queue is full, the most likely
next free tag is searched. If it isn't free, but another tag is, the
message is printed and some badness happens and the kernel halts.

Setting the queue depth to 1 always fixes the problem, because the drive
has no chance to reorder the tags.

Setting the queue depth to something as big as 128 also fixes the problem,
because the queue never gets that full.

Thanks,
Jochen
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
