Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E9F4482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Jun 2002 05:54:10 -0600 (MDT)
Message-ID: <3D15B72F.2080403@freebel.net>
Date: Sun, 23 Jun 2002 11:55:27 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: xam@cs.ucc.ie, parisc-linux@lists.parisc-linux.org,
	bruno_vidal@hpfrcu03.france.hp.com
Subject: Re: [parisc-linux] PA8000 modutils problems
References: <200206221953.g5MJrIHe000465@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

Dave,

The problem mentionned in this mail:
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-April/016119.html

about gcc-3.2 is the same with gcc-3.1.

Dono about some follow-up?

Thanks for advise,
	Joel

PS:
What means PR (how to fil it)?
And what means insn?

John David Anglin wrote:
>>Some weeks ago I also try to compile the kernel (32bits) with gcc-3.1 
>>(cvs) and eventhought it boots fine there was a problem
>>with network connections (as well telnet which uses inetd as well as ssh
>>which using its own sshd; this confirm the problem of compilation in 
>>network interface). Is this problem solved now?
> 
> 
> Not that I am aware of.  Maybe some of the debian folks have tried looking
> into it as they were talking about moving to a newer compiler release.  
> If it is a compiler problem, I would need a test case showing the
> miscompilation and preferably a filed PR.
> 
> Dave
