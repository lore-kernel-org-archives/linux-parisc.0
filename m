Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BE0E4832
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 11:46:47 -0600 (MDT)
Received: from hplms2.hpl.hp.com (hplms2.hpl.hp.com [15.0.152.33])
	by palrel11.hp.com (Postfix) with ESMTP id D864C1C01142
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 10:46:46 -0700 (PDT)
Message-ID: <75A9FEBA25015040A761C1F74975667D0144204D@hplex4.hpl.hp.com>
From: "Boehm, Hans" <hans_boehm@hp.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Cc: "'Hans.Boehm@hp.com'" <Hans.Boehm@hp.com>
Date: Fri, 25 Apr 2003 10:46:42 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
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

I have two questions arising from an attempt to port some profiling code to pa-risc.  Grant Grundler suggested I ask here.

1) I need to retrieve the pc value from the sigcontext structure passed to a timer signal handler.  In an earlier message, Paul Bame pointed me at sc_iaoq.  After a bit more reading, my conclusion was that sc_iaoq[0] should be a reasonable value to use as a sampled pc.  However I have been unable to see anything reasonable in that slot (or sc_iaoq[1] for that matter).  Presumably a struct sigcontext pointer is always passed as the third parameter to a signal handler?  And it's filled in for timer interrrupts?  What does profil() do?  (I tried to read the code, but it's hard to trace through all the configuration stuff.)

2) If I mark a C function as a constructor function, and compile it with -fPIC, it seems to run before globals are properly accessible.  The retrieval of the address of a global through the global offset table seems to return a bad address and the access faults.  Are there known issues in this area?  (The offending function actually ends up in the main program, if that matters.)

Please cc: me in the reply.

Thanks.

Hans
