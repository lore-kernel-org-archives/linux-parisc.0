Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77223483A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Apr 2002 07:51:40 -0600 (MDT)
Message-ID: <3CC2B937.8020509@freebel.net>
Date: Sun, 21 Apr 2002 13:05:59 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
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

Hi Randolph,

I try my hown gcc-3.2 (+ binutils, glibc) against kernel 2.4.18-pa19 
(not yet take the risc with pa20).

It compiles as well as with gcc3.0.x. It boots also but as soon as I try 
to connect it remotly with telnet or ssh (I forget to test ftp) the 
system crash:
"Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from ... to ...:

...

[those tree line seems to be repeated infinitely. well after 5 minutes I 
had to unplug the power supply to reboot]

Humm as it appends as well with telnet as ssh I suspect a inetd problem?

Any idea?

Thanks,
	Joel

PS: I will try your dpkg asap
