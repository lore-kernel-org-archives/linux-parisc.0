Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id A99784829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 May 2003 13:36:20 -0600 (MDT)
Received: from security.hp.com (security.hp.com [15.238.4.200])
	by atlrel8.hp.com (Postfix) with ESMTP id D78F11C0177B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 May 2003 15:36:19 -0400 (EDT)
Message-ID: <3EC53B08.2050904@debian.org>
Date: Fri, 16 May 2003 21:24:56 +0200
From: Joop Stakenborg <pa3aba@debian.org>
MIME-Version: 1.0
To: LaMont Jones <lamont@hp.com>
Cc: lamont+buildd@hp.com, 193261@bugs.debian.org
References: <20030514052335.GO14285@security.hp.com> <3EC25AE0.9070004@debian.org> <20030516191505.GA24104@security.hp.com>
In-Reply-To: <20030516191505.GA24104@security.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Resent-Message-Id: <20030516193619.9590EB18DA@security.hp.com>
Subject: [parisc-linux] Re: Bug#193261: glfer_0.3.2-1(hppa/unstable): FTBFS: assumes sys/io.h
 exists
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

LaMont Jones wrote:
> severity 193261 important
> --
> On Wed, May 14, 2003 at 05:04:00PM +0200, Joop Stakenborg wrote:
> 
>>>There are many architectures where sys/io.h does not exist.
>>
>>Sorry about that. I will make it a i386-only package for now.
> 
> 
> Please don't do that.  This bug should be important, not serious,
> which makes it not release-critical.  (Sorry about that...)
> 
> Unless the package is truely i386 specific in _function_ (not
> compile-ability), or depends on such, it should be Architecture: any.
> 

Okay,

where do I find information on functions and devices available on other 
architectures, e.g. glfer uses inb, outb and ioperm (they are in 
sys/io.h) on the parallel/serial port.

> lamont
> 
> 

Thanks,
Joop
