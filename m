Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AE25482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 07:43:59 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 9A9D8571
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 15:43:57 +0200 (METDST)
Message-ID: <3D3EAF4A.978D4311@hpfrcu81.france.hp.com>
Date: Wed, 24 Jul 2002 15:44:42 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be> <1027518935.6517.30.camel@irongate.swansea.linux.org.uk>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PAM unable to resolve symbol: pam_sm_cha
 uthtok
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

Hi All,

I have setup pam.d/rlogind pam.d/login in such way that I could rlogin to my
palinux machine.

All is configured ok (since it works sometimes).

Here is a login attempt.

iws1pb05:/home/phi> rlogin iws1pb02
Connection closed.
iws1pb05:/home/phi> rlogin iws1pb02
Kill is %.
Interrupt is control-C (^C).
iws1pb02:/home/phi>

After some attempt it works, I don't understand what make it fail several time
before success.

Here is the log of this session

Jul 24 15:38:33 iws1pb02 pam_rhosts_auth[7889]: allowed to phi@iws1pb05 as phi
Jul 24 15:38:36 iws1pb02 PAM_unix[7672]: (cron) session closed for user mail
Jul 24 15:38:36 iws1pb02 rlogind[7919]: PAM unable to resolve symbol:
pam_sm_cha
uthtok
Jul 24 15:38:36 iws1pb02 rlogind[7919]: PAM unable to resolve symbol:
pam_sm_cha
uthtok
Jul 24 15:38:36 iws1pb02 pam_rhosts_auth[7919]: allowed to phi@iws1pb05 as phi
Jul 24 15:38:37 iws1pb02 PAM_unix[7923]: (login) session opened for user phi
by
(uid=0)

Sounds like rlogind is not able to always map pam_sm_chauthtok, when it
succeed, the login session is opened.

Dunno if the order have importance here, sounds like when it fail the
pam_rhosts_auth[7889]: allowed to phi@iws1pb05 came first while when it fail
it cam after.

Any ideas
Thanx in advance
Phi
