Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1A234875
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Dec 2003 08:39:34 -0700 (MST)
Date: Wed, 17 Dec 2003 10:32:20 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Message-ID: <20031217153220.GA24083@systemhalted>
References: <200312152205.hBFM5CEn018329@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200312152205.hBFM5CEn018329@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: dlopen failed on 'libthread_db.so.1' -
	/lib/libthread_db.so.1: undefined symbol: ps_pglobal_lookup
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Dec 15, 2003 at 05:05:12PM -0500, John David Anglin wrote:
> I hacked together of a build of debian gdb-6.0-2 this afternoon.  When
> I start gdb, I see the following error:

My friend, that's amazing!
 
> dave@gsyprf11:~/gdb-6.0-2/objdir$ gdb/gdb
> dlopen failed on 'libthread_db.so.1' - /lib/libthread_db.so.1: undefined symbol: ps_pglobal_lookup
> GDB will not be able to debug pthreads.

Every pogram that links libthread_db.so.1 must provide a set of process
control primities that will allow libthread_db to access memory and
registers in the target process, start and stop the process, and lookup
symbols. ps_pglobal_lookup is always UND in libthread_db, and gdb should
have exported an arch version for the library to use :)

c.
