Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9700F4833
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Mar 2002 05:38:37 -0700 (MST)
Date: Tue, 05 Mar 2002 04:36:04 -0800 (PST)
Message-Id: <20020305.043604.08321823.davem@redhat.com>
To: sten@blinkenlights.nl
Cc: jochen@scram.de, linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <Pine.LNX.4.44-Blink.0202041155020.19625-100000@deepthought.blinkenlights.nl>
References: <Pine.NEB.4.33.0202041002120.2571-100000@www2.scram.de>
	<Pine.LNX.4.44-Blink.0202041155020.19625-100000@deepthought.blinkenlights.nl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Subject: [parisc-linux] Re: IPv6 Sparc64
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

   From: Sten <sten@blinkenlights.nl>
   Date: Mon, 4 Feb 2002 11:58:10 +0100 (CET)
   
   The reason I ask this is because I have been trying to setup a
   tunnel, and I cant get it to work either with ifconfig or iproute.
   
   [root@towel ip]# ip tunnel add blink mode sit remote x.x.x.x dev
   eth0
   ioctl: Invalid argument

The reason this fails is because SIOCADDTUNNEL uses SIOCDEVPRIVATE
which can't be translated properly to/from 32-bit apps running
on 64-bit kernels.
