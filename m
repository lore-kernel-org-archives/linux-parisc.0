Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from venus.it.swin.edu.au (venus.it.swin.edu.au [136.186.5.30])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72E54482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Jun 2002 03:30:57 -0600 (MDT)
Received: from mars.it.swin.edu.au (mars.it.swin.edu.au [136.186.5.35])
	by venus.it.swin.edu.au (8.11.6/8.11.2) with ESMTP id g529Utq06739
	for <parisc-linux@lists.parisc-linux.org>; Sun, 2 Jun 2002 19:30:55 +1000
Date: Sun, 2 Jun 2002 19:30:55 +1000 (EST)
From: John Newbigin <jnewbigin@it.swin.edu.au>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0206021923310.11687-100000@mars.it.swin.edu.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] STI problem on 715/50 with new kernels
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

I have an Appolo 715/50 with debian installed on it.  I have upgraded to 
the 2.4.18 kernel but when the kernel boots, the STI display goes blank.  
Everything works except I can't see the image.  When I press reset, the 
firmware comes up and I can see the output from the linux kernel on the 
screen still.

If someone can help it would be much appreciated.  The 2.4.9 kernel has 
some kind of problem with the framebuffer so I can't run X.

John.
