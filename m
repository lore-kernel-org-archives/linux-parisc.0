Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web21201.mail.yahoo.com (web21201.mail.yahoo.com [216.136.129.59])
	by dsl2.external.hp.com (Postfix) with SMTP id 57DDA4844
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 May 2002 15:59:07 -0600 (MDT)
Message-ID: <20020527215905.77842.qmail@web21201.mail.yahoo.com>
Date: Mon, 27 May 2002 14:59:05 -0700 (PDT)
From: Zibing Yang <email2bing@yahoo.com>
Subject: Re: [parisc-linux] Can I run popular Linux software on parisc-linux?
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0205271450140.11012-100000@garibaldi.apptechsys.com>
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

--- Jeremy Drake <jeremyd@apptechsys.com> wrote:
> On Mon, 27 May 2002, Zibing Yang wrote:
> 
> > > > I'm not aware of anyone trying to run an IA32
> > > emulator on parisc-linux.
> > > 
> > > fyi, bochs compiled from CVS sources (with small
> > > modifications) worked 
> > > for me.
> > 
> > Helge, can you provide more information about your
> > computer running Bochs? Are you able to run, for
> > example, windows 98, install stardard
> windows-based
> > softwares? How's the speed compared to the same
> > software run on PC+windows? Why didn't use wine? 
> > I am still heavily relying on windows-based
> software
> > everyday, so would love to install a
> windows-emulator
> > on my hp workstation.
> > Thanks a lot.
> > zibing
> I also tried bochs on my parisc machine.  It works
> ok, although slow.  I 
> installed NT 4 in it.  I had a few problems, but I
> was able to work around 
> them.
> 
> The reason that wine won't work is that wine is just
> a windows system call 
> emulator.  The program executes on the cpu, and I'm
> sure that none of your 
> windows programs will run on a parisc cpu :)
> 

How about plex86? Plex 86, bochs and wine are all
listed on
http://packages.debian.org/testing/allpackages.html.
I am confused because I thought all packages listed
there ought to work with parisc.


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
