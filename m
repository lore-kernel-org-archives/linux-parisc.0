Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx04.cluster1.charter.net (dc-mx04.cluster1.charter.net [209.225.8.14])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72FF94829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Aug 2002 16:59:20 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by dc-mx04.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 63908966 for parisc-linux@lists.parisc-linux.org; Mon, 19 Aug 2002 18:58:37 -0400
Message-ID: <3D61787C.7060502@charter.net>
Date: Mon, 19 Aug 2002 19:00:12 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200
 machine.
References: <3D5EB2D6.9090403@charter.net>  <20020817223713.GA25852@gate450.dyndns.org> <20020818051633.209BD4829@dsl2.external.hp.com> <3D5FC35F.7060402@charter.net>
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

Ok, I'm back from camp ( and work ). Here's what I did today:

(a) Installed new coin battery on motherboard
(b) Switched EtherPro100 card to 5V/32bit PCI slot

None of this brought back my motherboard's original
ethernet devices. I wish I could figure out what happened,
but I know that the never worked again after plugging a
HCRX-24Z card into the GSC bus. I got one error somewhere
that said something like

"... Something really bad has happened ..." but it never
re-appeared, and neither did the tulip or LASI ether devices.

Ok, through methodical emperical experimentation I have found
that the command:

"# ping -s 157 servername"

Will succeed. However,

"# ping -s 158 servername"

Will fail.


I have kernel 2.1.18, and will try 2.4.19 but I have to burn
a cd to get it on the machine so I have procrastinated. I will
give it a shot tonight, apply Andreas's patch and recompile.

About the last thing in the world I want to do is buy a
tape drive just to reload my firmware. Maybe one of you wizards
could cook up a way to flash it from linux like is done on
a Netwinder?

Later!
- Doug
