Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C26C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Apr 2002 09:31:09 -0600 (MDT)
Message-Id: <200204111531.g3BFV5Fv000173@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC support for dwarf2
To: joel.soete@freebel.net
Date: Thu, 11 Apr 2002 11:31:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1018526304.3cb57a60c2731@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Apr 11, 2002 01:58:24 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Well I finished to co gcc-3.2 and gcc3.1 cvs (that is long with small 33800 baud
> modem but that all I can get for cvs)
> 
> And I am already back with a problem:
> 
> Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:
> 
> > You would need to install the cvs binutils and cvs gcc versions in some
> > convenient location for the testing. 
> 
> Well I just figure out that there is no configure file in cvs of binutils.

Remove "configure" and do another checkout.  Use checkout rather than
update since sometimes update has problems in the toplevel directory.

> So, in the sources directory (/GNU-Dev/parisc-linux/src/binutils) I try autoconf
> but it just creates an empty configure?
> What do I wrong?

There are two types of "configure" files.  The toplevel configure script
in binutils (and also gcc) are currently manually maintained.  The
binutils "configure" file isn't autoconf generated.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
