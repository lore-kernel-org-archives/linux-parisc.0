Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77D07482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 11:16:45 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id B57D315C00D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 19:16:43 +0200 (CEST)
Date: Thu, 25 Jul 2002 19:16:43 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] i dont know jack
Message-ID: <20020725171643.GA8177@charite.de>
References: <DAV66Z9F2u1YOyJvAiS00005c0c@hotmail.com> <3D40275B.55D3B7C7@ruhr-west.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D40275B.55D3B7C7@ruhr-west.de>
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

Am 25.07.2002 um 18:29:15 +0200 schrieb Juergen Braukmann folgendes:

> Hi Rick, there probably is. Boot into some nini root environment and
> type:
> 
> dd if=/dev/null of=/dev/sda [assuming THE drive is sda]

bs=1M

Increase the blocksize heftily.

> this will overwrite the intire disk with zero bytes (or was /dev/zero
> the proper device for that??). Atlernetivly, /dev/random might be a good
> source of rubbish data. ;-)

/dev/zero is better.
Don't try /dev/random, it's too slow

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
S/He is playing DOOM, to release pent-up tension created by lusers. 
