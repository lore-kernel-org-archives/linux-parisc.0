Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (mail1.medianet-world.de [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id 9D0104837
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jun 2003 10:05:52 -0600 (MDT)
Message-ID: <3EEF3C94.3080300@bluehash.de>
Date: Tue, 17 Jun 2003 18:06:44 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Some 2.5-testing
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

Hi there,

I tried to get a running 2.5.70 kernel on my 715/100, but booting 
results in an endless loop with the following error:

    Badness in local_bh_enable at kernel/softirq.c:109
    Kernel addresses on the stack:
     [<10123d54>]  [<10105884>]  [<10127610>]  [<10285e0c>]
     [<102868c4>]  [<10285828>]  [<10287360>]  [<1012b6ac>]
     [<10287624>]  [<1012782c>]  [<101275c8>]  [<10175800>]
     [<10107000>]  [<101876ac>]  [<1010a068>]  [<10285828>]
     [<1028e468>]  [<103951b8>]  [<10123d54>]  [<1028f904>]
     [<1039541c>]  [<10100278>]  [<10109c5c>]

Only way to stop it, is to pull the plug...
Does anyone know a solution?
Another thing:  During compile I get this warning several times:   
"Warning: long unsigned int format, time_t arg (arg XX)" (But perhaps 
this warning is solved with the fixes jejb uploaded currently)

Some more informations:

    Kernel was generated  via make distclean, make oldconfig, make vmlinux.
    During compile I get this warning several times:   "Warnung: long 
unsigned int format, time_t arg (arg XX)"
    OS: Debian testing with gcc-3.3 and glibc-2.3.16
    HW: HP 715/100 with serial console and HIL-adaptor box (but no mouse 
or keyboard is connected to the adaptor)
    Debug: System.map and complete bootlog is here: 
http://rscholz.bluehash.de/parisc/

TIA,
    Ruediger
