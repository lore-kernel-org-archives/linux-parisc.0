Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Stephan Trajkoff" <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from "Stephan Trajkoff" <stephan@itp.bg>
   of "Sat, 13 Jul 2002 12:08:49 +0300." <20020713090726.99414482D@dsl2.external.hp.com>
References: <20020713090726.99414482D@dsl2.external.hp.com> 
Date: Sat, 13 Jul 2002 22:35:15 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020714043515.DEFB04832@dsl2.external.hp.com>
Subject: [parisc-linux] Re: mirror of parisc-linux
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

"Stephan Trajkoff" wrote:
> Hello man,
> I want to make mirror of parisc-linux.org
> my HP working stable and I want to make this main server in the=20
> institute where I am working
> www.bio21.bas.bg
> I think to change AIX PowerPC with this HP 819/K210
> What to make to do mirror of parisc-linux.org?


(I typed the following in from memory; it's the same steps as
accessing kernel source in the "linux" repository).

cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs login
cvs -d :pserver:anonymous@cvs.parisc-linux.org:/var/cvs co web
cd web
make ssi	(or make static)

See the web/Makefile for which ENV variables you can set to redirect
where the stuff gets installed. Thibaut (ESIEE) can help you
with this part.

> I have BIND9
> I want to have web address www.bg.parisc-linux.org.

I hope someone on the list can help you with this.
I don't maintain parisc-linux.org domain.

> After 2-3 weeks I want to make mirror of your FTP

ok.
Can someone tell me if rsync is enabled for ftp.parisc-linux.org:~ftp ?
I thought rsync of cvs.p-l.o was disabled for a while.

> I have 2mbit DSL modem with 256kpbs garanteed speed to world with=20
> burst 2mbit night and weekends

Cool!

grant
