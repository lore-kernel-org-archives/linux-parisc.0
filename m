Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jes Sorensen <jes@trained-monkey.org>
Cc: Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sys/io.h 
In-Reply-To: Message from Jes Sorensen <jes@trained-monkey.org>
   of "25 Jun 2002 12:18:31 EDT." <m3fzzbmiw8.fsf@trained-monkey.org>
References: <20020624150031.4DA034837@dsl2.external.hp.com> <20020624153959.GH812@tausq.org>  <m3fzzbmiw8.fsf@trained-monkey.org> 
Date: Tue, 25 Jun 2002 12:33:55 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020625183355.91DD1484D@dsl2.external.hp.com>
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

Jes Sorensen wrote:
> You really should support it similar to what we do on
> ia64. Ie. there's a Linux API here that allows you to map 'I/O' ports
> and access them. Basing the code on what's in the ia64 glibc tree
> would make it quite easy to get it up and running.

I don't think so. For two reasons:
a) ia64 maps the "iobase" address to user space
b) the ia64 method is fixed for the architecture on how
   to generate "legacy" IO port cycles (using iobase).

parisc has two different methods (dino vs elroy) and dino only
supports poking the PCI HBA to generate IO Port cycles.
Or am I over looking something?

grant
