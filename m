Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: James Mc Parlane <james@massive.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parsic function calling convention 
In-Reply-To: Message from James Mc Parlane <james@massive.com.au>
   of "Fri, 17 May 2002 11:52:01 +1000." <C1126400B227D411AC1200A00CC456B501448DAD@emailserver.massive.com.au>
References: <C1126400B227D411AC1200A00CC456B501448DAD@emailserver.massive.com.au> 
Date: Thu, 16 May 2002 22:07:17 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020517040717.7C7ED483D@dsl2.external.hp.com>
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

James Mc Parlane wrote:
> Does anyone please have info, or know where I can find info on the parisc2.0
> calling convention under hpux and parisc-linux?

There's several calling conventions that can run under PA2.0 architecture.
HPUX supports PA1.1 SOM and PA2.0 64-bit ELF.
The 64-bit ELF is the same for both OSs.
parisc-linux kernel has limited support for PA1.1 SOM but everything for
debian-hppa is built using PA1.1 ELF (32-bit).

I'm not aware of any authoritative, detailed documentation for PA1.1 ELF.
Since PA1.1 (32-bit) ELF is hack from the existing 64-bit ELF, 
You could start by looking at PA2.0 calling convention for HPUX.
Either docs.hp.com or www.parisc-linux.org should have that specification.
Otherwise, just write something in 'C' and see what gcc produces.

grant
