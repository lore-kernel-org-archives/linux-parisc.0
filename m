Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98463482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Aug 2002 07:53:54 -0600 (MDT)
Message-ID: <3D494C07.1040200@freebel.net>
Date: Thu, 01 Aug 2002 14:56:07 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HELP!
References: <3D478CE5.40107@itp.bg>
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


Stephan Trajkoff wrote:
> Hello, I am using parisc linux at the moment.
> But I want to install linux on another HP machine.
> But I must backup all HP-UX filesystem. How I can make it?
> Thanks in advance
> 


With HP-UX > 10.20 the easiest way is to use 'Ignite' (see application 
CDs or web) with a famous cmd looking like 'make_recovery_tape'. With -A 
option it will build a boot tape that will allow you to quickly recover 
your system. (read carefully man page to be sure it match your need)

and fbackup/frestore for the rest
