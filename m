Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from volta.midco.net (volta.midco.net [24.220.1.10])
	by dsl2.external.hp.com (Postfix) with SMTP id 23B7C483D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Apr 2002 07:24:58 -0600 (MDT)
Date: Wed, 10 Apr 2002 08:24:56 -0500
From: Jonathan Crockett <jcrockett@midco.net>
To: Matt McKenzie <linuxknight@attbi.com>
Cc: PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 715/75
Message-ID: <20020410082456.A20344@volta.midco.net>
References: <1018419728.2603.13.camel@mustang>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1018419728.2603.13.camel@mustang>; from linuxknight@attbi.com on Tue, Apr 09, 2002 at 11:22:07PM -0700
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

Hello,
  I have a 715/100 that had very similiar symptoms.  I have HP-UX on it
then installed debian.  After I had the base installed I moved the machine
and in a not so brilliant move added an external cdrom and changed keyboards
and mouse.  The system sat there and acted like it was having a very difficult
time coming to terms with the changes.  To fix it, swapped out the HIL mouse
that I had switch to with a ps2 three button mouse and took the external
cdrom off the scsi chain.  I let it sit for about 20 minute to a half hour
then it decided to boot.  I also found that I could not use the on board
video after I had used the addon card.  I even disconnect the addon card,
but it made no difference.

HTH
jc

On Tue, Apr 09, 2002 at 11:22:07PM -0700, Matt McKenzie wrote:
> I posted a while earlier, but no response has been forthcoming.
> 
> Does anyone have any idea what I can do so solve my problem with an HP
> 715/75, that displays the LEDs 1,2,6 on the front panel at power-up? 
> I have an HP monitor with it, and it stays blank.
> 
> The manual, if I'm reading it correctly, says the LEDs mean:
> 
> Internal inconsistency: IODC Entry_Init
> 
> But there is no mention of what this means exactly, or what to do about
> it.  
> 
> What can I do to resolve this, if possible?
> 
> I would very much like to put Linux on this machine.
> 
> It seems to me hardware questions aren't off-topic... does this just
> mean no one knows how to fix this?  Or is it because I have no
> transcript or logs to post (because the monitor is blank I can't see
> anything)?
> 
> Would it be possible to get a serial console working to see anything?
> I am guessing a standard RS232 Null-modem cable would work?
> 
> Also, I have the AUI-10bT ethernet transceiver, but I don't know if it
> has a valid static IP, or if it is trying DHCP lookup.
> 
> Any help would be appreciated.
> 
> Thanks.
> 
> 
> -- 
> 73 de K6LNX
> 
> Matt M.
> LinuxKnight
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
Jonathan Crockett
Network Engineer
Midcontinent Communications
