Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx05.cluster1.charter.net (dc-mx05.cluster1.charter.net [209.225.8.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A4DC4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 19:51:09 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by mx05.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 46977103 for parisc-linux@lists.parisc-linux.org; Mon, 19 Aug 2002 21:51:12 -0400
Message-ID: <3D61A0BD.5070102@charter.net>
Date: Mon, 19 Aug 2002 21:51:57 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on  C200
 machine.
References: <3D5EB2D6.9090403@charter.net> <3D61787C.7060502@charter.net>  <20020819235858.475274829@dsl2.external.hp.com>  <02081919040400.26310@localhost.localdomain> <20020820001826.5672E37D68@carmen.fc.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Just an update, I managed to burn the firmware update
to cdrom, boot it, and have updated my firmware to
the latest (6.3) for this machine. It did not fix
the onboard ethernet devices, however :-(


Now I have managed to get the source for
linux-2.4.19-pa3 onto the machine, made the
small patch on line 47 of eepro100.c, and
it is busily compiling away. Will post results
later.

- Doug
