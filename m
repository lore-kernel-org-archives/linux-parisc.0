Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx09.cluster1.charter.net (dc-mx09.cluster1.charter.net [209.225.8.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEC1A4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 20:27:27 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by dc-mx09.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 60238676 for parisc-linux@lists.parisc-linux.org; Mon, 19 Aug 2002 22:27:21 -0400
Message-ID: <3D61A942.2090206@charter.net>
Date: Mon, 19 Aug 2002 22:28:18 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on  C200
 machine.
References: <3D5EB2D6.9090403@charter.net> <3D61787C.7060502@charter.net>  <20020819235858.475274829@dsl2.external.hp.com>  <02081919040400.26310@localhost.localdomain> <20020820001826.5672E37D68@carmen.fc.hp.com> <3D61A0BD.5070102@charter.net>
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

Victory! The 2.4.19-pa3 kernel was the charm!

PCI IntelEtherExpressPro100 now working on C200!

I did add the " || defined(__hppa__)"
on line 47 of eepro100.c

Thanks very much to everybody for all the help,
this box has a new lease on life now!

Yaay!



B. Douglas Hilton wrote:
> Just an update, I managed to burn the firmware update
> to cdrom, boot it, and have updated my firmware to
> the latest (6.3) for this machine. It did not fix
> the onboard ethernet devices, however :-(
> 
> 
> Now I have managed to get the source for
> linux-2.4.19-pa3 onto the machine, made the
> small patch on line 47 of eepro100.c, and
> it is busily compiling away. Will post results
> later.
> 
> - Doug
