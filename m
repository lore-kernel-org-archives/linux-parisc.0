Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE3D24857
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  3 Mar 2004 11:45:47 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1AybM4-000087-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 03 Mar 2004 13:44:28 -0500
Date: Wed, 3 Mar 2004 13:44:27 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: another kernel oops
Message-ID: <20040303184425.GE32624@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 03, 2004 at 11:26:56AM +0100, Wichert Akkerman wrote:
> Something that might affect my machine is that I am running ext3 on
> top of md+raid1. I'm used to that being rock solid on i386, but it
> might be a culprit on hppa.

I don't think so, but perhaps. I tested my A500 with an external SCSI
array, ext3 ontop of md+raid5. Infact I could test it again when I find
some time. The box in question seems to be suffering some disk issues?

c.
