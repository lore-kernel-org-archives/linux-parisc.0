Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7797E4840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Aug 2003 16:07:12 -0600 (MDT)
Message-ID: <3F3EAB21.2030206@tiscali.be>
Date: Sat, 16 Aug 2003 22:07:29 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] N Class SMP pb ?
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

Hi Willy,

I come back to you about your mail: 
<http://lists.parisc-linux.org/pipermail/parisc-linux/2002-March/015827.html>
in which you spoke about "Strech (the memory controller)". Do you have 
more docs about this device?

I put you this question because in "PA 2.0 architecture" book, it is 
mentionned that 'systems' could be equiped with a hardware cache manager 
and so i would like to know if "Strech" is such a device.
Secondarily, is there some hp9000 with such 'hardware cache' manager and 
which one?

btw is there a means to get cache's tags and corresponding physical 
adresses to put it in a table to dump it for each processors (assuming 
that each processor cache are managed independently: don't have yet 
enough clue about this detail) at crash time (to verify if two processor 
do not try to access wrongly the same physical page)?

Thanks in advance,
    Joel
