Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id B55E9482D
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Aug 2002 12:24:38 -0600 (MDT)
Message-ID: <3D4C2EAA.4050508@freebel.net>
Date: Sat, 03 Aug 2002 19:27:38 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] "unaligned access to ... at ip=..." problem with
 evms and jfs
References: <1017854653.3cab3abdab486@webmail.tiscalinet.be> <20020403181337.GA3759@tausq.org>
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

Hey Randolph,

Randolph Chung wrote:
>>It seems harmless but not sure.
> 
> 
> well.... in general this is not a problem, however....
> 
> Fleedwood found a bug in the unaligned handler last week. it doesn't
> handle the pre/post increment cases of load and store, and there may be
> some cases where these messages will indicate the cause of errors.
> 
> I'll look into fixing this, but it might take some time.

I would just like to know if you already have the opportunity to have a 
look for a fix of this stuff (I know you are very busy this time and do 
not want to stress, just want to got news)

Thanks in advance,
	Joel
