Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E3494830
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 May 2002 15:52:29 -0600 (MDT)
Date: Mon, 27 May 2002 14:52:27 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Zibing Yang <email2bing@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Can I run popular Linux software on parisc-linux?
In-Reply-To: <20020527214318.75630.qmail@web21201.mail.yahoo.com>
Message-ID: <Pine.LNX.4.44.0205271450140.11012-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 27 May 2002, Zibing Yang wrote:

> > > I'm not aware of anyone trying to run an IA32
> > emulator on parisc-linux.
> > 
> > fyi, bochs compiled from CVS sources (with small
> > modifications) worked 
> > for me.
> 
> Helge, can you provide more information about your
> computer running Bochs? Are you able to run, for
> example, windows 98, install stardard windows-based
> softwares? How's the speed compared to the same
> software run on PC+windows? Why didn't use wine? 
> I am still heavily relying on windows-based software
> everyday, so would love to install a windows-emulator
> on my hp workstation.
> Thanks a lot.
> zibing
I also tried bochs on my parisc machine.  It works ok, although slow.  I 
installed NT 4 in it.  I had a few problems, but I was able to work around 
them.

The reason that wine won't work is that wine is just a windows system call 
emulator.  The program executes on the cpu, and I'm sure that none of your 
windows programs will run on a parisc cpu :)

> 
> 
> 
> > Greetings,
> > Helge
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Yahoo! - Official partner of 2002 FIFA World Cup
> http://fifaworldcup.yahoo.com
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
Take your dying with some seriousness, however.  Laughing on the way to
your execution is not generally understood by less advanced life forms,
and they'll call you crazy.
		-- "Messiah's Handbook: Reminders for the Advanced Soul"
