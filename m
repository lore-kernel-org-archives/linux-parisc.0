Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 730654A01
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 14:05:28 -0600 (MDT)
Date: Sun, 12 Oct 2003 16:02:02 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
Message-ID: <20031012200201.GC23999@systemhalted>
References: <3F872FDC.2090408@tiscali.be> <20031012181616.GA23999@systemhalted> <3F89A0AF.7020501@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F89A0AF.7020501@tiscali.be>
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

On Sun, Oct 12, 2003 at 06:42:55PM +0000, Joel Soete wrote:
> Hello Carlos,
> 
> I launch 'gbd evolution'
> (gdb) run
> to determine the new address in this env but failed before with message:
> Program received signal SIG37, Real-time event 37.
> 0x4193c574 in malloc_set_state () from /lib/libc.so.6
> 
> what's your opinion?

That's libpthreads realtime singal mechanism working.
You need to set "handle all nostop" and "handle all pass" in gdb.

Then you can do the math with /proc/<pid>/maps and the dying address to
calculate the _real_ library offset and function symbolic name.

c.
