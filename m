Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60F87482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 09:54:57 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id A4CF473E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 17:54:55 +0200 (METDST)
Message-ID: <3D3ECDFD.FFC416F6@hpfrcu81.france.hp.com>
Date: Wed, 24 Jul 2002 17:55:41 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PAM unable to resolve symbol: pam_sm_cha uthtok
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be> <1027518935.6517.30.camel@irongate.swansea.linux.org.uk>  <3D3EAF4A.978D4311@hpfrcu81.france.hp.com> <20020724151011.04630482B@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Grant Grundler wrote:
> 
> phi wrote:
> > Jul 24 15:38:36 iws1pb02 rlogind[7919]: PAM unable to resolve symbol:
> > pam_sm_chauthtok
> 
> This stinks alot like the other d-cache issues we've seen.
> (eg syslogd faulting at boot time)

Ouch didn't suspect this was that deep, I was focusing on this f. pam to
setup.

> 
> Which system model is this happening on? (/me guesses J5000 or PA2.0 K-class)

This is a C180 running
Linux iws1pb02 2.4.18-pa22 #48

This old version was from my 'stable' 712, then I instaled the C180 via a
brute 
cpio -p onto the C180. Then it is a narrow kernel.

My plan (tomorow?) is to get the linux CVS source and recompile...


BTW I think I saw the exact same behavior on a 712 does the dcache problem
present there too? 

Well will see what I got tomorow.
Cheers,
Phi
