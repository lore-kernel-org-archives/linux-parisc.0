Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E3BD482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Mar 2002 02:04:01 -0700 (MST)
Date: Fri, 1 Mar 2002 10:03:58 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disk I/O error
Message-ID: <20020301090358.GB27911@charite.de>
References: <15486.51802.168431.29867@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <15486.51802.168431.29867@gargle.gargle.HOWL>
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

Am 01.03.2002 um 01:24:58 +0100 schrieb Matthias Klose folgendes:

> ok, seems that the root fs is damaged after some locks and following
> resets. For the reinstallation, which kernel should be used on a A500? 
> I Tried 2.4.17-64-smp, 2.4.16-64-smp, 2.4.17-64 and
> 2.4.16-64. However, the machine locks up after three, maybe four days.
>  
> init-2.05a# ls -l /lib/libext2fs.so.2.4  
> ls: /lib/libext2fs.so.2.4: Input/output error 
>  
> attempt to access beyond end of device 
> 08:06: rw=0, want=6803996040, limit=1999856 
> attempt to access beyond end of device 
> 08:06: rw=0, want=7745165772, limit=1999856 
> attempt to access beyond end of device 
> /p/pari/libpari1-dev_2.1.3-1_hppa.deb 
> Size: 1540332 

This sounds like broken hardware! At least whenever this pops up on
the ext3 list, then it's mostly due to bad hardware, bizarre UDMA
settings or the hardware being used out of spec.

In this case, going to ext3 might not help, since ext3 is ext2, except
for the journal.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
S/He is down to the 7-11 down the street, to buy extra strong coffee and caffeine tabs. 
