Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from volta.midco.net (volta.midco.net [24.220.1.10])
	by dsl2.external.hp.com (Postfix) with SMTP id D5226482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Apr 2002 11:22:03 -0600 (MDT)
Date: Wed, 10 Apr 2002 12:22:03 -0500
From: Jonathan Crockett <jcrockett@midco.net>
To: Matt McKenzie <linuxknight@attbi.com>
Cc: Jonathan Crockett <jcrockett@midco.net>,
	PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 715/75
Message-ID: <20020410122203.G20344@volta.midco.net>
References: <1018419728.2603.13.camel@mustang> <20020410082456.A20344@volta.midco.net> <1018457310.3772.8.camel@mustang> <20020410120239.E20344@volta.midco.net> <1018459011.3804.12.camel@mustang>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1018459011.3804.12.camel@mustang>; from linuxknight@attbi.com on Wed, Apr 10, 2002 at 10:16:30AM -0700
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

I just had to let mine run for about 30 minutes.  Leave it on before you
go home and see if it still is the same when you come back in the morning.
The other alternative is to start removing everything one at a time and see
if it comes up.  Drives, memory that sort of thing.  Also try not plugging
in any keyboard/mouse etc.
Good luck!
jc

On Wed, Apr 10, 2002 at 10:16:30AM -0700, Matt McKenzie wrote:
> No, I have never seen this box run anything.  It was sitting in the
> downstairs "lab", and the prof brought it up to the classroom to test
> it, maybe use as a print server.  But he never hooked it up... I guess
> we should have.  But he had to teach the class.  The others are all in
> use so he probably can't give me a different one.
> 
> I suppose there is no way to just tell it to reconfigure and stop
> searching for hardware that might not be there?
> 
> 
> On Wed, 2002-04-10 at 10:02, Jonathan Crockett wrote:
> > My box came with a HIL to ps2 converter box thingy that has a PS2 keyboard
> > port, a PS2 mouse port and a HIL port on it.  When I changed things around
> > the machine had to think for a long time, before video came up.
> > I take it that you have seen this machine run an OS?  If not in it's previous
> > life it may have had a piece of hardware that is no longer there and it is
> > searching for it.  Also I have always had a odd thing with the number lock
> > light on PS2 keyboards and 715s.  If they are working correctly it doesn't
> > light up, but if there is a problem it is light and stays lit.
> > 
> > Hopefully this sheds some light for you.
> > jc
> > 
> > On Wed, Apr 10, 2002 at 09:48:30AM -0700, Matt McKenzie wrote:
> > > Hmmm.  I have a HIL mouse and kb with it.  This model doesn't have ps/2
> > > ports so I can't change the kb.  I can put a serial mouse on it.
> > > But I have no idea what it had attached to it before.  I am assuming it
> > > was HIL kb and mouse but I can't be sure.
> > > 
> > > We got a batch of HP workstations donated to the school from a local
> > > company.  Many are in use in a lab, being used as X terminals logged
> > > into Sun servers.  But the actual classroom lab now has mostly all Suns
> > > so the HPs aren't used much.  
> > > 
> > > I am also not sure of the state of the hard drives.  There are (2) 9g
> > > scsi IIRC.  I don't know if HP-UX is even still on there or anything. 
> > > But you would think it would at least come up with a prompt of some sort
> > > even if HP-UX was wiped.
> > > 
> > > This machine doesn't have any add-on cards, no floppy or internal CD or
> > > anything.  I do have an external 2x scsi cd I can use with it but I
> > > haven't hooked it up yet.
> > > 
> > > With your problem did the screen stay blank?
> > > 
> > > I will try with the serial mouse.  Thanks for the suggestion.
> > > 
> > > 
> > > On Wed, 2002-04-10 at 06:24, Jonathan Crockett wrote:
> > > > Hello,
> > > >   I have a 715/100 that had very similiar symptoms.  I have HP-UX on it
> > > > then installed debian.  After I had the base installed I moved the machine
> > > > and in a not so brilliant move added an external cdrom and changed keyboards
> > > > and mouse.  The system sat there and acted like it was having a very difficult
> > > > time coming to terms with the changes.  To fix it, swapped out the HIL mouse
> > > > that I had switch to with a ps2 three button mouse and took the external
> > > > cdrom off the scsi chain.  I let it sit for about 20 minute to a half hour
> > > > then it decided to boot.  I also found that I could not use the on board
> > > > video after I had used the addon card.  I even disconnect the addon card,
> > > > but it made no difference.
> > > > 
> > > > HTH
> > > > jc
> > > > 
> > > > On Tue, Apr 09, 2002 at 11:22:07PM -0700, Matt McKenzie wrote:
> > > > > I posted a while earlier, but no response has been forthcoming.
> > > > > 
> > > > > Does anyone have any idea what I can do so solve my problem with an HP
> > > > > 715/75, that displays the LEDs 1,2,6 on the front panel at power-up? 
> > > > > I have an HP monitor with it, and it stays blank.
> > > > > 
> > > > > The manual, if I'm reading it correctly, says the LEDs mean:
> > > > > 
> > > > > Internal inconsistency: IODC Entry_Init
> > > > > 
> > > > > But there is no mention of what this means exactly, or what to do about
> > > > > it.  
> > > > > 
> > > > > What can I do to resolve this, if possible?
> > > > > 
> > > > > I would very much like to put Linux on this machine.
> > > > > 
> > > > > It seems to me hardware questions aren't off-topic... does this just
> > > > > mean no one knows how to fix this?  Or is it because I have no
> > > > > transcript or logs to post (because the monitor is blank I can't see
> > > > > anything)?
> > > > > 
> > > > > Would it be possible to get a serial console working to see anything?
> > > > > I am guessing a standard RS232 Null-modem cable would work?
> > > > > 
> > > > > Also, I have the AUI-10bT ethernet transceiver, but I don't know if it
> > > > > has a valid static IP, or if it is trying DHCP lookup.
> > > > > 
> > > > > Any help would be appreciated.
> > > > > 
> > > > > Thanks.
> > > > > 
> > > > > 
> > > > > -- 
> > > > > 73 de K6LNX
> > > > > 
> > > > > Matt M.
> > > > > LinuxKnight
> > > > > 
> > > > > 
> > > > > _______________________________________________
> > > > > parisc-linux mailing list
> > > > > parisc-linux@lists.parisc-linux.org
> > > > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > > > 
> > > > -- 
> > > > Jonathan Crockett
> > > > Network Engineer
> > > > Midcontinent Communications
> > > > 
> > > > _______________________________________________
> > > > parisc-linux mailing list
> > > > parisc-linux@lists.parisc-linux.org
> > > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > > -- 
> > > 73 de K6LNX
> > > 
> > > Matt M.
> > > LinuxKnight
> > > 
> > > 
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > 
> > -- 
> > Jonathan Crockett
> > Network Engineer
> > Midcontinent Communications
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> -- 
> 73 de K6LNX
> 
> Matt M.
> LinuxKnight
> 

-- 
Jonathan Crockett
Network Engineer
Midcontinent Communications
