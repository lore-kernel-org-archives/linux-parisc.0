Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F166482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 09:01:34 -0700 (MST)
To: Nathan Neulinger <nneul@umr.edu>
Subject: Re: [parisc-linux] telnetd on hppa: strange behaviour?
Message-ID: <1008086487.3c162dd79749d@webmail.tiscalinet.be>
Date: Tue, 11 Dec 2001 17:01:27 +0100 (CET)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1008007312.3c14f890e4d33@webmail.tiscalinet.be> <3C15005D.4884E0C5@umr.edu> <1008010546.3c150532c596f@webmail.tiscalinet.be> <3C1508B2.3CCCDCF2@umr.edu>
In-Reply-To: <3C1508B2.3CCCDCF2@umr.edu>
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

Hi Nathan,

According to apt-get man page the difference between upgrade and dist-upgrade
seems to me to be in the selection of more or less important packages:

man apt-get
...
       dist-upgrade
              dist-upgrade, in addition to performing  the  func­
              tion  of upgrade, also intelligently handles chang­
              ing dependencies with  new  versions  of  packages;
              apt-get  has  a "smart" conflict resolution system,
              and it will attempt to upgrade the  most  important
              packages  at  the expense of less important ones if
              necessary.  The /etc/apt/sources.list file contains
              a  list of locations from which to retrieve desired
              package files.

But I always forget to log stdout and sdterr of this command.
Do you know if it exist somewhere a log of dpkg actions (like
/var/adm/sw/sw....log of HPUX SD)?

        Joel

Quoting Nathan Neulinger <nneul@umr.edu>:

> Hmm... never seen that symptom except with the early kernels, which
> obviously isn't the case here.
> 
> I'm not familiar with 'dist-upgrade', but I typically run 'apt-get
> update' then 'apt-get upgrade'. 
> 
> -- Nathan
> 
> joel.soete@freebel.net wrote:
> > 
> > Hi Nathan,
> > 
> > Sorry but once again I forgot to mention it (because I thought to a
> telnetd bug):
> > I experiment it with my last 2.4.16-pa16 (not the one in debian pool
> package) as
> > weel as with kernel 2.4.9-32 (this from the debian pool
> > kernel-image-2.4.9-32_82.1_hppa.deb package).
> > And I also forgot to mentioned that I just do some 2h ago a apt-get
> dist-upgrade
> > and "0 pkg upgraded, 0 newly installed, 0 to remove and 2 not
> upgraded". Also
> > may be too early uptodate?
> > 
> > Thanks for additional advises,
> >         Joel
> > 
> > Quoting Nathan Neulinger <nneul@umr.edu>:
> > 
> > > joel.soete@freebel.net wrote:
> > > >
> > > > Hi all,
> > > >
> > > > I use to work with a telnet connection to my hppa linux box.
> > > > And I just notice that if I do a ls -al in a directory containing
> many
> > > soft
> > > > links the telnet session stop with "connection close by foreign
> hosts"
> > > (and not
> > > > with a simple ls)?
> > > >
> > > > (I just do a apt-get dist-uprade but nothing has to be done. Also
> I
> > > assume to be
> > > > up-to-date)
> > > >
> > > > Thanks in advance for advice,
> > > >         Joel
> > >
> > > Get yourself a more recent kernel. That's a known problem with the
> > > kernel on the 0.9.2 media.
> > >
> > > -- Nathan
> > >
> > > ------------------------------------------------------------
> > > Nathan Neulinger                       EMail:  nneul@umr.edu
> > > University of Missouri - Rolla         Phone: (573) 341-4841
> > > Computing Services                       Fax: (573) 341-4216
> > >
> > >
> > 
> > -------------------------------------------------
> > This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
> 
> -- 
> 
> 
> ------------------------------------------------------------
> Nathan Neulinger                       EMail:  nneul@umr.edu
> University of Missouri - Rolla         Phone: (573) 341-4841
> Computing Services                       Fax: (573) 341-4216
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
