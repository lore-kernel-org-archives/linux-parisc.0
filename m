Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (unknown [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C906482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Sep 2002 20:16:39 -0600 (MDT)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 17nrct-0003uU-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 07 Sep 2002 22:16:39 -0400
Date: Sat, 7 Sep 2002 22:16:39 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RFC - Changes to traps.c (Handlers for 13, changes to 16/17)
Message-ID: <20020908021639.GA14982@systemhalted>
References: <20020908015059.GN5679@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020908015059.GN5679@systemhalted>
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

pa,

If you have a burning desire to build with this change
then you'll need this bit too.

I'm possibly tempted to stay with the 'parisc_terminate' name
and just change the comments for the function. 

c.


--- linux/arch/parisc/mm/fault.c	2001-12-04 18:19:47.000000000 -0500
+++ linux/arch/parisc/mm/fault.c.new	2002-09-07 22:12:29.000000000 -0400
@@ -256,7 +256,8 @@
 		}
 	}
 
-	parisc_terminate("Bad Address (null pointer deref?)", regs, code, address);
+	parisc_handle_code("Bad Address (null pointer deref?)", regs, code, address);
+	/* NOT REACHED */
 
   out_of_memory:
 	up_read(&mm->mmap_sem);
