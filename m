Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from exchange2.elgin.cc.il.us (exchange2.elgin.edu [66.158.60.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC7A04829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 15:56:26 -0700 (MST)
Message-ID: <5D69EA3878E6D411B43C00508BFD7283049FB53E@exchange2.elgin.edu>
From: "Mehta, Miten" <mmehta@elgin.edu>
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] bootp and tftp
Date: Wed, 22 Jan 2003 16:53:03 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello,

parisc boot howto does not talk much on setting bootp up as much I
understood.  I referred hp docs too to verify bootp setup.  But it did not
work.  Here are more details.

appended to /etc/bootptab:
===========================
peacock:\
	hd=/var/opt/ignite:\
	rp=/linux:\
	ht=ethernet:\
	ha=000100010001:\           <=============changed
	ip=192.168.1.21:\           <=============changed
	bf=lifimage:\
	sm=255.255.255.0:\
	gw=192.168.1.1:\
	to=7200:                     <========== here I added ba for
bootpquery


enabled tftp and bootp in sam and seems resulted in following two lines in
/etc/inetd.conf
============================================================================
===============
tftp        dgram  udp wait   root /usr/lbin/tftpd    tftpd\
	/opt/ignite\
	/var/opt/ignite
bootps	dgram	udp	wait	root	/usr/lbin/bootpd	bootpd

There are bootps, bootpc, tftp entries in /etc/services.

ps -e | grep bootp  shall show it running and so does for rbootd.

Error I get when doing 
bootpquery 000100010001 -s myhost 
is Address in use.




-----Original Message-----
From: Randolph Chung [mailto:randolph@tausq.org]
Sent: Wednesday, January 22, 2003 11:18 AM
To: Mehta, Miten
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] bootp and tftp


> bootpquery is complaining address in use for client query.  I went into
sam
> and had enabled both bootp and tftp.  Then added client section as:

um, is there a question in there some place? what did you try? what did
the error message say? 

this sounds like a generic bootp setup problem.... have you looked at
the parisc boot howto?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
