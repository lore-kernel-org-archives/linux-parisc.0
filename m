Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PAM unable to resolve symbol: pam_sm_cha uthtok 
In-Reply-To: Message from phi <phi@hpfrcu81.france.hp.com>
   of "Wed, 24 Jul 2002 15:44:42 +0200." <3D3EAF4A.978D4311@hpfrcu81.france.hp.com>
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be> <1027518935.6517.30.camel@irongate.swansea.linux.org.uk>  <3D3EAF4A.978D4311@hpfrcu81.france.hp.com> 
Date: Wed, 24 Jul 2002 09:10:10 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020724151011.04630482B@dsl2.external.hp.com>
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
> Jul 24 15:38:36 iws1pb02 rlogind[7919]: PAM unable to resolve symbol:
> pam_sm_chauthtok

This stinks alot like the other d-cache issues we've seen.
(eg syslogd faulting at boot time)

Which system model is this happening on? (/me guesses J5000 or PA2.0 K-class)

I don't know where the problem is though.

grant
