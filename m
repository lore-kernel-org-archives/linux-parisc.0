Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C8254829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 08:58:04 -0600 (MDT)
Date: Tue, 8 Oct 2002 08:00:53 -0700
From: Randolph Chung <randolph@tausq.org>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot (micro) hang
Message-ID: <20021008150053.GC24881@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3DA2945D.7010301@visoel.de> <3DA2E27B.5708975E@hpfrcu81.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DA2E27B.5708975E@hpfrcu81.france.hp.com>
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

> I have made no progress today.
> Thomas helped to turn on verbosity during boot and remove LED display code,
> but yet it fail to boot 'normally' and I still get the micro hang (15 minute).
> 
> Here is the boot display.

Make sure you have the System.map that goes along with the kernel you
are booting, then when you observe the hang on bootup, press the TOC
button (usually a recessed button on the back of the box). The machine
should automatically reboot. At the next reboot at the PDC prompt, do
"ser pim" and capture the output. Put that output and your System.map
someplace others can access (or you can try to match it up yourself, 
the interesting bits are where the IAOQ and GR02 values lay in 
System.map)

good luck :)
randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
