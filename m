Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D6A948BE
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 12:19:44 -0600 (MDT)
Date: Sun, 12 Oct 2003 14:16:17 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) do_page_fault?
Message-ID: <20031012181616.GA23999@systemhalted>
References: <3F872FDC.2090408@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F872FDC.2090408@tiscali.be>
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

On Fri, Oct 10, 2003 at 10:17:00PM +0000, Joel Soete wrote:
> Hi all,
> 
> The new evolution crash on my c110 [debian unstable] (even though I test 
> successfully a previous release on my b2k) with a kernel 2.6test7pa5.
> 
> do_page_fault() pid=3917 command='evolution' type=7 address=0x413627db
> vm_start = 0x41332000, vm_end = 0x413b3000
> 

Run it through a debugger. Try to find out what was at this address?

c.
