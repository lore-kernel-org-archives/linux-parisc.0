Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FE28486C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Mar 2002 08:27:41 -0700 (MST)
Date: Wed, 6 Mar 2002 16:27:39 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not freeing initmem?
Message-ID: <20020306152739.GQ787@charite.de>
References: <20020306151913.GO787@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020306151913.GO787@charite.de>
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

Am 06.03.2002 um 16:19:13 +0100 schrieb Ralf Hildebrandt folgendes:

> What does that mean? Why is the memory not freed on PA-RISC, but freed
> on x86?

OK, I grepped for that string and found the infamous FIXME:

/* FIXME: */
        printk(KERN_INFO "NOT FREEING INITMEM (%dk)\n",
                        (&__init_end - &__init_begin) >> 10);
        return;			

OTOH, why does the code below that not work for PA-RISC?
