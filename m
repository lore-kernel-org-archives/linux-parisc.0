Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA28334
	for <parisc-linux@puffin.external.hp.com>; Sat, 7 Oct 2000 20:53:57 -0600
To: parisc-linux@thepuffingroup.com
Cc: debian-hppa@lists.debian.org
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 07 Oct 2000 22:54:49 -0400
Message-ID: <877l7khwjq.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] debian-hppa-newlibc archive moving to debian-hppa
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Since the change in symbol versions (as well as the introduction of
linuxthreads support) broke all old binaries, I've been rebuilding the
Debian base system over the last few days with the new glibc.  These
packages have been building up in
ftp://puffin.external.hp.com:/pub/debian-hppa-newlibc/ though I
haven't really announced the existence of this archive.

At this point I have replaced my entire system with new binaries, and
the newlibc archive is in fact more complete and up-to-date than the
original one, so I would like to remove or archive the old one and
switch to using this one exclusively.  So, I've moved the old one to
/pub/debian-hppa-oldlibc, and the new one to /pub/debian-hppa.

I believe Matt Taggart is putting together a new base system tarball
using these new packages (we now have almost all of the relevant parts
of the Debian 'base' section built).

I've been uploading NMU-versioned source packages (just the .diff.gz
and .dsc) of any packages that have required significant source
changes to /pub/debian-hppa-source.  This does not include packages
that need our versions of config.{guess,sub}, however.  I haven't had
time to submit the changes to the maintainers yet but I'll try to get
it done this coming week.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
