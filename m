Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65D9A484C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Apr 2002 09:49:40 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id cyvtmaaa for parisc-linux@lists.parisc-linux.org; Sun, 21 Apr 2002 08:48:31 -0700
Date: Sun, 21 Apr 2002 08:53:01 -0700
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <joel.soete@freebel.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
Message-ID: <20020421155301.GL7563@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <3CC2B937.8020509@freebel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CC2B937.8020509@freebel.net>
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

> I try my hown gcc-3.2 (+ binutils, glibc) against kernel 2.4.18-pa19 
> (not yet take the risc with pa20).
> 
> It compiles as well as with gcc3.0.x. It boots also but as soon as I try 
> to connect it remotly with telnet or ssh (I forget to test ftp) the 
> system crash:

if you still feel adventurous, check out the kdb cvs branch of the
kernel and you'll at least be able to tell where it crashed... :-)

randolph
