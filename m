Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4508482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 08:58:24 -0700 (MST)
Date: Fri, 8 Nov 2002 16:57:23 +0100
Message-ID: <3DA3C54C00004BEE@ocpmta5.be.tiscali.com>
In-Reply-To: <20021108201200.K28523@neep.com.au>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] [Trap 26 -> EXT3?][If you feel bored, test these 2.5 changes...]
To: "Andrew Shugg" <andrew@neep.com.au>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Andrew,
>jsoe0708@tiscali.be said:
>> Back to 2.5.46-pa1, I revert the patch and rebuild the kernel and the
kernel
>> won't boot more. So it seems that problem comes from ext3 usage.
>> How may I come back to ext2 (tune2fs -O ^has_journal /dev/md0 [my boot
>partition]
>> ) I nerver do it and a bit affraid to loose my system :(
>> 
>> Joel
>
>It should be as simple as changing your root fs type from 'ext3' or
>'auto' to 'ext2' in /etc/fstab.

You have perfectly right, just at boot time:
EXT2-fs warning (device md(9,0)): ext2_fill_super: mounting ext3 fs as ext2

...

But it would not help to make the system boot (I also remove ext3 support
from kernel):
...
Unable to find swap-space signature

Stack Dump:
....

Thanks a lot,
    Joel



-------------------------------------------------------------
Tiscali Complete, l'accès Internet moins cher que gratuit ! Plus d'info:
http://complete.tiscali.be
