Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from exchange2.elgin.cc.il.us (exchange2.elgin.edu [66.158.60.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58340482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Jan 2003 10:11:42 -0700 (MST)
Message-ID: <5D69EA3878E6D411B43C00508BFD7283049FB53A@exchange2.elgin.edu>
From: "Mehta, Miten" <mmehta@elgin.edu>
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 22 Jan 2003 11:08:17 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] bootp and tftp
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

bootpquery is complaining address in use for client query.  I went into sam
and had enabled both bootp and tftp.  Then added client section as:
peacock:\
	hd=/var/opt/ignite:\
	rp=/linux:\
	ht=ethernet:\
	ha=xxxxxxxxxxxx:\        --------->actual value replaced with x
	ip=xx.xx.xx.xx:\
	bf=lifimage:\
	sm=255.255.255.0:\
	gw=xx.xx.xx.1:\
	to=7200: ba

Thanks.
