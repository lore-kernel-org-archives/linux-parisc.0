Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx14.cluster1.charter.net (dc-mx14.cluster1.charter.net [209.225.8.24])
	by dsl2.external.hp.com (Postfix) with ESMTP id D09C54829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 14:31:30 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by dc-mx14.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 81853646 for parisc-linux@lists.parisc-linux.org; Sat, 17 Aug 2002 16:33:14 -0400
Message-ID: <3D5EB2D6.9090403@charter.net>
Date: Sat, 17 Aug 2002 16:32:22 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine.
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

Hello list. For some reason my onboard LAN devices
all mysteriously died and disappeared from the
firmware, so I purchased an eepro100 card to try
and get some networking connectivity back.

When I modprobe eepro100 it seems to be ok. I can
do an 'ifup -a' and then ifconfig lists my eth0
and it appears to be configured properly. I can
ping other servers in my LAN, and I can do an
ftp login, but as soon a I type "ls" it goes out
to lunch and locks up.

Likewise I can ping numeric ip's on the internet,
but name resolution is not working.

Could this be an endianness problem? Any ideas?

Any tips on how to reactivate the onboard ether
devices would be greatly appreciated too.
