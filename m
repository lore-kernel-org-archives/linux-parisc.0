Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA25883
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 17:04:08 -0600
Date: Wed, 9 Jun 1999 18:04:03 -0500 (CDT)
From: xomina <ryan@email.labmed.umn.edu>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trying to get HP-UX working
In-Reply-To: <199906092243.SAA15136@hiauly1.hia.nrc.ca>
Message-ID: <Pine.GSO.4.02.9906091758240.5674-100000@email.labmed.umn.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Wed, 9 Jun 1999, John David Anglin wrote:

> > here's the gnu directory taken from my HP-UX 10.20 machine at work.  it
> 
> Are they static so that they will work without shared libraries?

oops, no, they appear to be dynamic.  at least, i assume that's what this
means:

mercury:/usr/local/gnu/bin> chatr bash
bash: 
         shared executable 
         shared library dynamic path search:
             SHLIB_PATH     disabled  second 
             embedded path  disabled  first  Not Defined
         internal name:
             bash
         shared library list:
             dynamic   /usr/lib/libc.1
         shared library binding:
             deferred 
         static branch prediction disabled
         data page size: 4K
         instruction page size: 4K
mercury:/usr/local/gnu/bin> 

sorry, i didn't install them on this machine, and wasn't aware they
weren't statically-linked.  comes from being a non-kernel programmer and
being a bit hasty to find something i could possibly help out with, i
suppose!

ryan
