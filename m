Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E07384911
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 09:53:49 -0700 (MST)
Message-Id: <200402221653.i1MGrkS8014490@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb: followup
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sun, 22 Feb 2004 11:53:46 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040222060002.GI25019@baldric.uwo.ca> from "Carlos O'Donell" at
	Feb 22, 2004 01:00:02 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> c. Write a 'Changelog' entry for the changes, and describe why you are
>    making these changes (e.g. compiling with gcc-3.5). These entries
>    have a very special format, look closely, and follow the GNU coding
>    convetions.

I'm not sure about glibc but in gcc ChangeLog entries only include
a concise list of changes for each function/macro changed.  The "why"
goes in your patch submission letter.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
