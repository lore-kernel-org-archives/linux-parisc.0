Return-Path: <hppa-linux@thepuffingroup.com>
Date: Mon, 8 Mar 1999 15:43:56 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.9903081417030.7297-100000@centauri.osfi-bsif.gc.ca>
Message-ID: <Pine.LNX.3.96.990308154028.5280k-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [hppa-linux] Initial HILO release.
Resent-Message-ID: <"1On071.0.533.PQ3vs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org



I've packaged Jason Eckhardt's HP bootloader, renamed it to 'HILO',
versioned it, and started on proper licensing.  This is teh first source
release, and it's clear that the source needs work.  I'll try to spend
some time on that next week.  We'll also put it into CVS.

In the mean time, here are the releases:

ftp://sod.res.cmu.edu/pub/parisc/hilo/hilo-0.01.gz (binary, precompiled)
ftp://sod.res.cmu.edu/pub/parisc/hilo/hilo-0.02.tar.gz (source)

The source does cross compile (with cross compilers I've not yet
released), I haven't tried native compiling yet.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team


-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
