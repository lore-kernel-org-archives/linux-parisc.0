Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD2C6484B
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Nov 2003 03:59:09 -0700 (MST)
Message-ID: <3FACCC88.4010404@tiscali.be>
Date: Sat, 08 Nov 2003 10:59:20 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org>
In-Reply-To: <20031108015946.GC19436@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


Grant Grundler wrote:
> On Fri, Nov 07, 2003 at 06:52:58PM +0100, Joel Soete wrote:
> 
>>>[...] I bet it's calling BLKGETSIZE64 and our put_user() is broken.
>>
>>I trusted that Grant merged the same code in 2.4 and 2.6 for put_user() some
>>time ago?
> 
> 
> put_user()?
> I don't recall.
> 
> 
>>Is it the same with 64bits kernels?
> 
> 
> Can you point me at the modified 2.4 file and I'll check.
> 
IIRC include/asm-parisc/uaccess.h

I do not work more on this stuff because I am awaiting patch that 
Randolph (always iirc) should still have in its tree to change the 
management of exception (which Matthew assumes to never occur in kernel 
mode iirc) (sorry but I just spend half an hour to find back this thread 
but without success :( )

hth,
	Joel
