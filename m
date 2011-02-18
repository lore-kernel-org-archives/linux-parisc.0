From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: binutils change break glibc build
Date: Thu, 17 Feb 2011 22:29:01 -0500
Message-ID: <20110218032901.GA3729@hiauly1.hia.nrc.ca>
References: <20110217010912.GA26425@hiauly1.hia.nrc.ca> <20110217011712.4B48651C3@hiauly1.hia.nrc.ca> <20110217041325.GA8857@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: carlos@systemhalted.org, James.Bottomley@hansenpartnership.com,
	linux-parisc@vger.kernel.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110217041325.GA8857@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 16 Feb 2011, John David Anglin wrote:

> > > It's probably not a glibc issue:
> > > 
> > > /home2/dave/debian/glibc/eglibc-2.11.2/build-tree/hppa-libc/libc.so.6:     file 
> > > format elf32-hppa-linux
> > > 
> > > Contents of section .init_array:
> > >  159008 ffffffff 0015bee2 00000000           ............    
> > 
> > Hmmm, there is no .init_array section in the installed libc.  So, maybe
> > it's not the patch.

This is a binutils bug introduced by merging .ctors into .init_array.
That's where the ffffffff and 00000000 values come from.  They actual
mark the limits of the .ctors list.

It can be avoided by building binutils with --disable-initfini-array.
This is not exactly obvious...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
