Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CDAD482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Oct 2002 11:50:38 -0700 (MST)
Message-ID: <3DBC44F9.1010006@freebel.net>
Date: Sun, 27 Oct 2002 19:56:41 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: Stephan <stephan@itp.bg>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ext3 /
References: <20021027092756.D8B974862@dsl2.external.hp.com> <20021027093355.GD9302@charite.de>
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


Ralf Hildebrandt wrote:
> On Sun, Oct 27, 2002 at 11:28:04AM +0200, Stephan wrote:
> 
>>Hello,
>>/dev/sda1   *         1        15     61814   f0  Linux/PA-RISC boot
>>/dev/sda2            16       441   1756398   83  Linux
>>/dev/sda3           442       562    498883   82  Linux swap
>>/dev/sda4           563      1017   1875965   83  Linux
>>it is my partitions of my linux
>>Can I make /dev/sda2 which is / partition ext3 or reiserfs? i.e. journaling
>>FS
> 
> 
> Yes, why not?
> 
> tune2fs -j /

Afaik palo does not support reiserfs; if you boot from your kernel 
located into /boot it could be a problem !?

> 
>>After I made dist-upgrade 1 week ago, my uname don't works, if I write uname
>>-a there is segmentation fault, any ideas?
> 
> 
> I filed a bug report a few days ago. Check the Debian bug database.
> 
Yes I also test it and it works fine; thanks a lot

Cheers,
	Joel
