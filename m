Return-Path: <hppa-linux@thepuffingroup.com>
Date: Wed, 10 Mar 1999 22:18:57 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] New cross compiling RPMs
In-Reply-To: <7678BED5A989D211A39000A0C94309E908D623@wehcml06>
Message-ID: <Pine.LNX.3.96.990310221021.7915B-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"qysf.0.bw4.jOpvs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org


On Thu, 11 Mar 1999, PG40 KCLin wrote:
> About the new cross compiler, does it support floating-point emulation for
> PA-RISC 1.1 architecture level 0? In the cross tool, does it support the
> source level debugger based on Windows? or gdb only?

I'm not actually quite sure about the answer to this question; certainly
their is no native floating point support, although there may be
emulation.

This should be easy enough to test.

For the kernel side of things, which is the most immediate concern, we
don't need floating point yet anyway.

There's currently no working gdb, although that shouln't be too difficult
to straighten out either.  I don't know what you mean by the source level
windows debugger, but I'm interested.

-= Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team



-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
