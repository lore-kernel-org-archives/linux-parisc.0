Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id A37C04829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Dec 2002 03:07:48 -0700 (MST)
Date: Tue, 3 Dec 2002 11:07:39 +0100
From: The PA/Linux ESIEE Team <puffin@esiee.fr>
To: JKonrad@linotype.com
Cc: parisc-linux@lists.parisc-linux.org
Message-Id: <20021203110739.4d90dbdf.puffin@esiee.fr>
In-Reply-To: <OF02C25910.B1912FC4-ONC1256C84.0034303D-C1256C84.00349772@linotype.com>
References: <B6457593-060D-11D7-9FA0-0030656F07A2@esiee.fr>
	<OF02C25910.B1912FC4-ONC1256C84.0034303D-C1256C84.00349772@linotype.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: K-Class Pa-Linux
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

On Tue, 3 Dec 2002 10:32:49 +0100
JKonrad@linotype.com wrote:

> We got Linux installed nice and easy after switching to ttyB0..... 
> unfortunately, after the installation, when we rebooted, he did this:

[...] (It's a K200)

>     0/vmlinux32 3960547 bytes @ 0x44000  
>   
> Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyB0 
> palo_kernel=3/boo'
> Selected kernel: /boot/vmlinux from partition 3  
>  
> offset_read(2, 0x0006c7a4, 128, 1476411392) can't seek past 238026752  
>  
> ext2_iget: read errorERROR: open /boot/vmlinux from partition 3 failed 
> 
> "
> 
> too bad..... you have any ideas?????

Yes I do:
I'm quoting my previous mail. Here is the idea...

> I strongly recommend you take a look at the PA-RISC/Linux Boot HOWTO, 
> it contains much interesting info:
> http://pateam.esiee.fr/doc.html
> 
> and you should also take a look here:
> http://www.fr.parisc-linux.org/
> and especially to the m-l archives here:
> http://www.fr.parisc-linux.org/mailing-lists/
> 
> You should find almost everything you need there...

If you had read it, this problem wouldn't even have happened...
http://pateam.esiee.fr/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/paloappusage.html#bootablepartition

What's more, palo _does_ tell you what's wrong:
"can't seek past 238026752"

Please, take some time to read the doc that has been written to avoid repeating endlessly the same answers to the same questions...

For what it's worth, we, as a community of developers and users, have a mailing-list to share knowledge. You'll find much help there too, that's why I'm CC'ing this mail.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
