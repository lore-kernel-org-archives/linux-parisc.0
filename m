Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0459B48CE
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 12:42:55 -0600 (MDT)
Message-ID: <3F89A0AF.7020501@tiscali.be>
Date: Sun, 12 Oct 2003 18:42:55 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
References: <3F872FDC.2090408@tiscali.be> <20031012181616.GA23999@systemhalted>
In-Reply-To: <20031012181616.GA23999@systemhalted>
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

Hello Carlos,

I launch 'gbd evolution'
(gdb) run
to determine the new address in this env but failed before with message:
Program received signal SIG37, Real-time event 37.
0x4193c574 in malloc_set_state () from /lib/libc.so.6

what's your opinion?

Joel

Carlos O'Donell wrote:
> On Fri, Oct 10, 2003 at 10:17:00PM +0000, Joel Soete wrote:
> 
>>Hi all,
>>
>>The new evolution crash on my c110 [debian unstable] (even though I test 
>>successfully a previous release on my b2k) with a kernel 2.6test7pa5.
>>
>>do_page_fault() pid=3917 command='evolution' type=7 address=0x413627db
>>vm_start = 0x41332000, vm_end = 0x413b3000
>>
> 
> 
> Run it through a debugger. Try to find out what was at this address?
> 
> c.
> 
