Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4C44482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 14:12:31 -0700 (MST)
To: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] console switching with C160 Hyperdrive option card 
In-Reply-To: Message from "James P. Kinney III" <jkinney@localnetsolutions.com>
   of "11 Dec 2001 14:07:31 EST." <1008097651.31094.35.camel@archimedes.localnetsolutions.com>
References: <1008039310.31094.29.camel@archimedes.localnetsolutions.com>
 <E16DicI-0000Xi-00@linuxlab.wdf.sap-ag.de>  <1008097651.31094.35.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Dec 2001 14:12:29 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011211211229.531E637E86@carmen.fc.hp.com>
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

"James P. Kinney III" writes...

> More research. Current firmware is 2.1. Latest firmware from HP is 6.1.
> And it "fixes" some 3rd  party graphics card problems.
> 
> As soon as I get a blank tape, I'll upgrade the firmware (scary
> process!).

IMHO, updating via bootp/tftp is the easiest way(assuming you have them 
setup). You can also burn the firmware image on a CDROM and boot from that. 
You can even boot it from a harddisk by putting it in the right place (using 
the right dd command).

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
