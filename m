Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8639482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 02:06:59 -0700 (MST)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id C8A0A393
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 10:05:09 +0100 (MET)
Received: from hpfrcu81.france.hp.com (localhost [127.0.0.1]) by iws1pb05.france.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 SMKit7.01) id KAA01446 for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 10:04:08 +0100 (MET)
Message-ID: <3C454208.C1F66E59@hpfrcu81.france.hp.com>
Date: Wed, 16 Jan 2002 10:04:08 +0100
From: phi 4369 <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <1011117789.3c446eddddc77@webmail.tiscali.be> <20020115181518.F19567@parcelfarce.linux.theplanet.co.uk> <1011169636.3c453964624af@webmail.tiscali.be>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] rlogin --> Connection closed.
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

On my freshly installed 712 palinux when trying to rlogin into it I got this

iws1pb05:/home/phi> rlogin iws1pb02
Connection closed.
iws1pb05:/home/phi>


Indeed I did all I thought was enough to make it workable (install of the
rlogind, resolv.conf, nsswitch.conf, inetd.conf, .rhosts with rights ok,
etc...)

I think the setup is ok, because I eventually succeed sometime to get in with
the following


iws1pb05:/home/phi> for i in 0 1 2 3 4 5 6 7 8 9
do
rlogin iws1pb02
done

Connection closed.
Connection closed.
Connection closed.
Last login: Wed Jan 16 09:51:35 2002 from iws1pb05 on pts/0
Linux iws1pb02 2.4.17-pa11 #2 Tue Jan 15 10:51:25 CET 2002 parisc unknown
iws1pb02:/home/phi>

iws1pb05 from which I try the rlogin is running HPUX11 and is a B2000.  Dunno
if it helps to know that.

Any ideas ?

Phi

--
mailto:Philippe_Benard@hp.com
WTEC HP-UX kernel debugging tools
