Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA15662
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 17:34:29 -0600
Received: (from steve@localhost)
	by osiris.silug.org (8.9.3/8.9.3) id SAA07930
	for parisc-linux@thepuffingroup.com; Mon, 14 Jun 1999 18:34:45 -0500
From: Steven Pritchard <steve@osiris.silug.org>
Message-Id: <199906142334.SAA07930@osiris.silug.org>
To: parisc-linux@thepuffingroup.com
Date: Mon, 14 Jun 1999 18:34:45 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] HP-UX 11.0 binaries
List-ID: <linux-parisc.vger.kernel.org>

I started packaging up binaries of useful things for HP-UX 11.0.  The
binaries (in gzip'd depot format) are at

    ftp://puffin.external.hp.com/pub/parisc/binaries/depot/

Note that everything is configured to install in /usr/local.  (Oh, and
if you have a fresh install of HP-UX 11, you might want to tighten up
the permissions on /usr/local/*.)

The list of stuff I've compiled is somewhat short at this point, but
I'll be adding to it as quickly as my 715/100 will allow.  ;-)  So far
I've got the following:

    bash-2.03-1.depot.gz (*Completely* untested - If you try it
        tonight, do me a favor and let me know if it works.)

    binutils-2.9.1-1.depot.gz (Vanilla binutils 2.9.1.)

    cvs-1.10.6-1.depot.gz (Slightly patched because of a conflicting
        definition in rpc/nis.h for UNKNOWN.  Not tested as much as
        I'd like...

    diffutils-2.7-1.depot.gz
    fileutils-4.0-1.depot.gz
    flex-2.5.4-1.depot.gz

    gcc-2.8.1-1.depot.gz (Compiled to use HP's as.)
    gcc-2.8.1-2.depot.gz (Compiled to use GNU as, and with stabs
        support.)

    less-3.40-1.depot.gz (Seems a little broken.  Something must have
        changed in HP's curses libs from 10.20 to 11.0...)

    make-3.77-1.depot.gz
    patch-2.5-1.depot.gz

(I left egcs-1.1.2 compiling as I left work.  It should be out there
first thing in the morning, US time.)

Probably the quickest way to install any of the above is to gunzip the
file, then do "swinstall -v -s foo-xxx.depot foo".  (I'll try to type
up some more detailed instructions, plus some instructions for
creating the packages, later in the week.)

Let me know how the stuff works for you if you install any of it.

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(217)698-1694             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
