Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 006C34839
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Jun 2002 06:08:41 -0600 (MDT)
Message-ID: <3D15BA95.7070101@freebel.net>
Date: Sun, 23 Jun 2002 12:09:57 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [Fwd: Re: [parisc-linux] PA8000 modutils problems]
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

Hi Bruno,

Till some month ago I encounter a problem when I compile the kernel with 
gcc-3.2 or gcc-3.1. Those kernels boot well but as soon as you try a 
network connection (telnet or ssh) the system crash.

It is a problem in network kernel part but dono yet if it is IP stack or 
  interface problem.

As some month ago could you send me your last lkcd code so that I could 
try to locate the problem with at least gdb?

Thanks in advance for your help,
	Joel

 > Dave,
 >
 > The problem mentionned in this mail:
 > 
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-April/016119.html
 >
 > about gcc-3.2 is the same with gcc-3.1.
 >
 > Dono about some follow-up?
 >
 > Thanks for advise,
 > 	Joel
 >
 > PS:
 > What means PR (how to fil it)?
 > And what means insn?
 >
 > John David Anglin wrote:
 > >>Some weeks ago I also try to compile the kernel (32bits) with gcc-3.1
 > >>(cvs) and eventhought it boots fine there was a problem
 > >>with network connections (as well telnet which uses inetd as well 
as ssh
 > >>which using its own sshd; this confirm the problem of compilation in
 > >>network interface). Is this problem solved now?
 > >
 > >
 > > Not that I am aware of.  Maybe some of the debian folks have tried 
looking
 > > into it as they were talking about moving to a newer compiler 
release.
 > > If it is a compiler problem, I would need a test case showing the
 > > miscompilation and preferably a filed PR.
 > >
 > > Dave
