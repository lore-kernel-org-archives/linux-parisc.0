Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9FF7F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 05:38:27 -0700 (MST)
Date: Thu, 3 Jan 2002 13:38:22 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem with Samba on a D370
In-Reply-To: <20020103093230.GA1241@sleepie.demon.co.uk>
Message-ID: <Pine.LNX.4.42.0201031237480.8858-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Herb

This is fixed in the latest Debian version of samba available in the
unstable/sid distribution.  The new version number of the samba packages
is: 2.2.2-4

This package doesn't yet appear to be built for hppa, but if you add an
appropriate deb-src line for sid in your sources.list file then you can
download and build the new samba packages using:

apt-get source samba --build

& then install the packages using 'dpkg -i'

Hope I'm not teaching grandma to suck eggs here.

Regards
PeteM

On Thu, 3 Jan 2002, Richard Hirst wrote:

> On Wed, Jan 02, 2002 at 08:33:54PM -0500, Herb Radford wrote:
[snip]
>
> "samba busted see #126763, hppa glibc problem with file locking"
>
> Check that bug # on bugs.debian.org for more details.  There is a patch
> to samba to avoid the glibc problem there, I think, but I havn't tried
> it.
>
> Richard
