From: "David S. Miller" <davem@redhat.com>
Subject: [parisc-linux] Re: IPv6 Sparc64
Date: Tue, 05 Mar 2002 04:36:04 -0800 (PST)
Message-ID: <20020305.043604.08321823.davem__37117.0578095645$1416621121$gmane$org@redhat.com>
References: <Pine.NEB.4.33.0202041002120.2571-100000@www2.scram.de>
	<Pine.LNX.4.44-Blink.0202041155020.19625-100000@deepthought.blinkenlights.nl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: jochen@scram.de, linux-kernel@vger.kernel.org,
	parisc-linux@lists.parisc-linux.org
To: sten@blinkenlights.nl
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <Pine.LNX.4.44-Blink.0202041155020.19625-100000@deepthought.blinkenlights.nl>
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
