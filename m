Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51635485F
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Jul 2002 02:04:14 -0600 (MDT)
Date: Sat, 6 Jul 2002 10:04:12 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Message-ID: <20020706080412.GA11226@charite.de>
References: <20020702190842.GR25586@charite.de> <20020702192147.GC3678@systemhalted> <20020702193116.GU25586@charite.de> <20020703052415.GB32490@charite.de> <20020703121306.GA8464@systemhalted> <20020703121737.GS15228@charite.de> <20020703164631.F0CE2483A@dsl2.external.hp.com> <20020703165234.GG13244@charite.de> <20020703203227.GE9009@systemhalted> <20020705175920.GM25868@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020705175920.GM25868@charite.de>
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

Am 05.07.2002 um 19:59:20 +0200 schrieb Ralf Hildebrandt folgendes:
> Am 03.07.2002 um 16:32:27 -0400 schrieb Carlos O'Donell folgendes:
> 
> > Could you please try this out and see if you see anything in your logs :)
> 
> Nothing. Nothing at all.

I went to pa48 today, still with the patches to power.c you sent me.
There are no log entries. To make sure I get all logging, I use:

*.*   /var/log/debug

Nevertheless, no logging. Does the patch to power.c output it's data
to the console?

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
"All programmers are playwrights and all computers are lousy actors."  -Anon.
