Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id E56F4482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 18:19:02 -0600 (MDT)
Date: Fri, 31 May 2002 00:55:59 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PATCH: flush_icache_page() and flush_icache_range()
Message-ID: <20020530235559.GB3471@sleepie.demon.co.uk>
References: <20020529060242.GG3471@sleepie.demon.co.uk> <200205291409.g4TE9RG7027493@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200205291409.g4TE9RG7027493@hiauly1.hia.nrc.ca>
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

On Wed, May 29, 2002 at 10:09:27AM -0400, John David Anglin wrote:
> > You mean like
> > 
> > Breakpoint 1, main (argc=1, argv=0xbff00148) at ../simple.c:16
> > 16              a = thing(1);
> > (gdb) print thing(7)
> 
> Yes.  I find this an extremely useful feature in debugging gcc.  It
> has various hooks to print rtl and tree structs that I miss not being
> able to use.

I've got this semi-working now.  Simple cases like the example above now
work (thing(n) returns n*2).  Other cases, such as print strlen("abc")
crash the target program.  I'll keep working on it and post a diff once
it works for a few more cases.

Richard
