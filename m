Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 470784840
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  4 Feb 2004 04:35:42 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id i14BZftY024660
	for <parisc-linux@lists.parisc-linux.org>; Wed, 4 Feb 2004 11:35:41 GMT
Date: Wed, 4 Feb 2004 11:35:40 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0402041109580.8086@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Kernel driver/feature support
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I was just wondering what drivers (hardware drivers, networking options,
filesystems etc.) are actually usable in Linux/PA-RISC.
It would be interesting to know whether there are some drivers
that are not working correctly on PA-RISC (apart from the obvious ones).

So far I successfully tested (and used extensively) the following
drivers on my C240 and C3k using a 32bit kernel (and linux-2.4.24):

- SMBfs
- Autofs (v4)
- IP tunneling
- IPv6
- netfilter (iptables) and netfilter6 (ip6tables)
- Bridging
- QoS
- Traffic Shaping
- OHCI (with internal USB bus, and 5 port USB-2.0 card)
- RealTek RTL-8139 PCI Fast Ethernet (8139too)
- IBM Olympic Token Ring PCI (olympic)

Third party:
- hostap (Netgear MA311 Prism2.5 PCI card, works great, also hostapd)



Drivers that didn't work (or not of good quality):
===============
- Hermes Prism2.5 PCI (hermes, works somewhat, but flaky connection)
- EHCI (loads, but can't use a USB-2.0 HiSpeed or FullSpeed capable device,
  but using OHCI driver instead is successful)


I'd be interested if somebody else has success (or failure) reports of
drivers/fs not listed here, and reports from what's working with 2.6
(since I can't test it here)

Greetings,
  Max
