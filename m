Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0BE04868
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 01:25:59 -0600 (MDT)
To: joel.soete@freebel.net
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
Message-ID: <1026717872.3d3278b080023@webmail.tiscalinet.be>
Date: Mon, 15 Jul 2002 09:24:32 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Randolph Chung <randolph@tausq.org>, joel.soete@freebel.net,
	parisc-linux@parisc-linux.org
References: <20020712073628.GB8838@tausq.org> <1026467388.3d2ea63c0ac65@webmail.tiscalinet.be> <20020712150139.GC8838@tausq.org> <1026491023.3d2f028f991a1@webmail.tiscalinet.be> <1026716599.3d3273b741097@webmail.tiscalinet.be>
In-Reply-To: <1026716599.3d3273b741097@webmail.tiscalinet.be>
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

Quoting joel.soete@freebel.net:

> Hi Randolph,
> 
> I am not so luky as you are:
> The kernel compiles well and also boot well but always the same problem
> (in
> addition to modules problems) as soon as I do an network connection with
> ssh the
> system crash:
> (I just note on the sti console)
> sshd (pid 322): illegal instruction (code 8)
> ...
> kernel panic...
> 
> Humm I try to boot from serial consol but there the behaviour is not
> quiet the same:
> the system always panic but this time only a long list of:
> Warning! stack pointer and cr30 do not correspond!
> Dumping virtual address stack instead
> Dumping satck from ... to ...:
> ....
> (no stop or very very long?)
> 
> Well a last test (after I have to unplug replug power cable) at the
> serial
> console : 
> jso@palinux:~$ ssh localhost
> The authenticity of host 'localhost (127.0.0.1)' can't be established.
> RSA key fingerprint is ..:..:..:..:..:..:..:..:..:..:..:..:..:..:..:...
> Are you sure you want to continue connecting (yes/no)? yes
> Warning: Permanently added 'localhost' (RSA) to the list of known
> hosts.
> jso@localhost's password: 
> 
> and the system also crashes (whithout any messages?).
> 
> So may I believe that the problems come first from ip stack itself and
> not from
> ethernet driver?
> 
> Hmm I am also curious to test your .config file?
> 

How do you build gcc (3.1.1) natively or as crosscompiler (I do the last may be
it is the problem?)?

Joel


> 
> Quoting joel.soete@freebel.net:
> 
> > Quoting Randolph Chung <randolph@tausq.org>:
> > 
> > > > PS: Can you do a telnet or an ssh connection when this kernel is
> > > running? IIRC
> > > > as well as gcc-3.1 as gcc-3.2, I always reach well to build and
> > boot
> > > kernels
> > > > (without kdb) but the system crashes as soon as you try to
> connect
> > it
> > > via the
> > > > network.
> > > 
> > > yes, i can ssh into the box.
> > > 
> > Great news, I am impatient to also test it :)
> > 
> > Thanks a lot,
> >     Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
