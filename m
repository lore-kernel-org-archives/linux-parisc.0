Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PAM unable to resolve symbol: pam_sm_cha uthtok 
In-Reply-To: Message from phi <phi@hpfrcu81.france.hp.com>
   of "Wed, 24 Jul 2002 17:55:41 +0200." <3D3ECDFD.FFC416F6@hpfrcu81.france.hp.com>
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be> <1027518935.6517.30.camel@irongate.swansea.linux.org.uk> <3D3EAF4A.978D4311@hpfrcu81.france.hp.com> <20020724151011.04630482B@dsl2.external.hp.com>  <3D3ECDFD.FFC416F6@hpfrcu81.france.hp.com> 
Date: Wed, 24 Jul 2002 12:44:51 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020724184451.685B04838@dsl2.external.hp.com>
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

phi wrote:
> Ouch didn't suspect this was that deep, I was focusing on this f. pam to
> setup.

It may not be.

> BTW I think I saw the exact same behavior on a 712 does the dcache problem
> present there too? 

No - and I don't expect it on C180 either.
So far I've only see it on SMP machines (with SMP kernel).

thanks,
grant
