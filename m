Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BBE8482B
	for <parisc-linux@parisc-linux.org>; Wed, 31 Oct 2001 13:07:39 -0700 (MST)
To: thunder7@xs4all.nl
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] WARNING: DO NOT APT-GET UPGRADE HPPA 
In-Reply-To: Your message of "Wed, 31 Oct 2001 20:21:07 +0100."
             <20011031202107.A2654@alpha.of.nowhere>
References: <20011026182706.2800037FD7@carmen.fc.hp.com> <1004225524.624.6.camel@cube> <1004233084.1307.6.camel@cube>  <20011031202107.A2654@alpha.of.nowhere> 
Date: Wed, 31 Oct 2001 13:07:37 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011031200737.B7A7937CB2@carmen.fc.hp.com>
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

Jurriaan on Alpha writes...

> So what is the current status? Is there anything fundamental relying on
> python, or is it safe to upt-get update again?

We still don't know the extent of the problem and until known working
binutils/gcc/glibc are uploaded I think you should hold off. I'm hoping the
patch that Alan Modra posted earlier is the answer. I'm rebuilding the
toolchain now.

Stay tuned...

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
