Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D474482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  7 Sep 2002 16:04:03 -0600 (MDT)
Subject: Re: [parisc-linux] [PATCH] Serial MUX support for Nova and K-Class
	systems.
From: Ryan Bradetich <rbradetich@uswest.net>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D7A7171.CEA2FEAE@gmx.at>
References: <1029991787.4813.14.camel@beavis>  <3D7A7171.CEA2FEAE@gmx.at>
Content-Type: text/plain
Date: 07 Sep 2002 16:03:59 -0600
Message-Id: <1031436239.581.19.camel@beavis>
Mime-Version: 1.0
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

Hi Christoph,

I'm working on solving the problem why we do not find
the MUX device.  The ESIEE team has generously given
me access to an E35 so I could poke around the HP-UX
iotree and see what I could find.

This is the summary of what I have found:

name_buffer instance hw_addr   parent  sibling    child
"bc"               1      56 0x43b3a0 0xc15240 0xc15040
  "scsi1"          0      52 0xc15000 0xe74140 0xc15080
  ""              -1      53 0xc15000 0xc15200        0
  "mux2"           0      56 0xc15000        0        0
"bus_adapter"      0      60 0x43b3a0 0xe74240 0xc15280
  "lan2"           0       6 0xc15240        0        0
"processor"        0      62 0x43b3a0 0xe74280        0
"memory"           0      63 0x43b3a0        0        0

The MUX sits at: 56/56 with HPA: 0xfffb8000
