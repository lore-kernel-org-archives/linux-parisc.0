From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 24 Mar 2005 18:34:42 -0500 (EST)
Message-ID: <200503242334.j2ONYgHV007051@hiauly1.hia.nrc.ca>
References: <20050324223346.GE29361@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050324223346.GE29361@colo.lackof.org> from "Grant Grundler" at
	Mar 24, 2005 03:33:46 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > No.  Currently in kernel builds, the use of FP registers is completely
> > disabled and integer multiplication is done using the millicode library.
> 
> Erm...objdump disagrees:
> grundler <541>hppa64-linux-objdump -rD vmlinux | fgrep xmpy | wc
>    1654   11578   82683
> 
> First occurance is here:
> 000000001010bca0 <__muldi3>:

Not good.  This is from libgcc.  I see that the muldi3 expander is
disabled when we disable FP regs.  I'm not sure why but it doesn't
seem right.  Using the expander, would cause the use of the millicode
routine when FP regs are disabled.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
