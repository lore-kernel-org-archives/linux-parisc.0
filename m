Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12502.mail.yahoo.com (web12502.mail.yahoo.com [216.136.173.194])
	by dsl2.external.hp.com (Postfix) with SMTP id D7A724829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Oct 2002 08:34:46 -0600 (MDT)
Message-ID: <20021010143443.83773.qmail@web12502.mail.yahoo.com>
Date: Thu, 10 Oct 2002 07:34:43 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] boot (micro) hang
To: phi <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DA51F44.1898AA4@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Phi,

Well if you knew an HP CE that could help you with the firmware update
it wouldn't have been that big a deal.  From your E-mail address you
look like you work for HP.  Our tools for updating firmware are
pre-burned on what we used to call the ECU disk.  That's how I updated
my firmware on my C180 to 6.3 (6.3 is for the C200/240 but runs fine on
my C180).  I perform firmware updates quite often on HP machines along
the whole product line and most of the time it is an effortless thing. 
Of course the tools use hardware folks use to update firmware are not
available to the general public.  The N and L class servers can be
updated now with just an HP-UX patch, but that doesn't help the Linux
folks.  My C180 doesn't hang at boot using the
palinux-2.4.18-pa55-20020715-netinst.iso image.  I completed the
install over the internet.  Not exactly sure why you are having
problems with hangs where I do not.  Are you using HP disks or third
party?  Are you running the boot-up in fastboot mode or normal test all
the memory mode?  If you are running fastboot I would say turn it off
and let it run self-test on your memory.  I found 2 bad simms when I
turned off fastboot on my machine.  I now run with fastboot on, but
it's a great tool to troubleshoot memory problems.  If you really want
to know what the difference in firmware revs are, I could get you that
info from my firmware CD's or from an HP service note.  That info I can
give you.  If you have any questions about my C180 set-up don't
hesitate to ask.  I'm currently helping a guy from HP Greely set-up his
C180.

Derek Engelhaupt
HP CE

--- phi <phi@hpfrcu81.france.hp.com> wrote:
> Grant Grundler wrote:
> > 
> > phi wrote:
> > > My Firmware is
> > >
> > > Firmware Version  5.2
> > 
> > sorry - I forgot to mention the FAQ explains how to determine
> > what the latest available rev is.
> > 
> 
> The FAQ also say it is dangerous to update a firware and you do it
> only if
> absolutly necessary.
> 
> In my situation I had the proof that booting the prev kernel was ok,
> so the FW
> was good enough for this.
> 
> I own only 1 c180, and will not have another one, also based on your
> recomandation I prefered discover what made the C180 hanging at boot,
> at least
> I learned a bit more about the iotree discovery, while upgrading the
> firmware
> to 6.1 would have learned me nothing and I could have lost my
> machine.
> 
> So all in all I am happy with my temp solution, I am glad that Ryan
> will
> revisit his code and fix this regression for the benefit of all.
> 
> So apparently FW5.2 is good enough for what I am doing, the patch
> catalog only
> give the latest version number and doesn't tell what diff there is
> between 5.2
> and 6.1, without good explanation, there is no reason to upgrade.
> 
> The link 'HPUX-11 Patch Management' is obso and don't work (for me).
> 
> Thanx for your help and pointers.
> Cheers,
> Phi
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


__________________________________________________
Do you Yahoo!?
Faith Hill - Exclusive Performances, Videos & More
http://faith.yahoo.com
