Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD7CA482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 00:05:53 -0600 (MDT)
To: Patrick Caulfield <patrick@tykepenguin.com>
Subject: Re: [parisc-linux] Probleme while compiling last CVS kernel.
Message-ID: <1023429951.3d004d3f0b639@webmail.tiscalinet.be>
Date: Fri, 07 Jun 2002 08:05:51 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <3CFF593A.18910E50@admin.france.hp.com> <20020606130006.GE1080@tykepenguin.com> <1023388448.3cffab201378e@webmail.tiscalinet.be> <20020606184327.GO1080@tykepenguin.com>
In-Reply-To: <20020606184327.GO1080@tykepenguin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Patrick Caulfield <patrick@tykepenguin.com>:

...
> I don't know about the 64bit compile switches (I only have a 32bit HP
> box) but
> to get LVM running you'll need to take all the bits from
> arch/sparc64/kernel/ioctl32.c inside the 
> 
> #if defined(CONFIG_BLK_DEV_LVM) || defined(CONFIG_BLK_DEV_LVM_MODULE)
> 
> #endif
> 
> and replace the bits from arch/parisc/kernel/ioctl32.c with them. I
> suspect it
> will work. If it does then get a patch together and put it into the CVS
> !
Great, I will see.
> 
> I'm pleased (though not very surprised) that LVM works OK on 32 bit
> machines.

So surprised too ??


Many thanks,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
