Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12CAC482A
	for <parisc-linux@parisc-linux.org>; Tue, 30 Jul 2002 09:33:27 -0600 (MDT)
Message-Id: <200207301533.g6UFXLge019647@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC CVS strange update?
To: willy@debian.org (Matthew Wilcox)
Date: Tue, 30 Jul 2002 11:33:20 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@parisc-linux.org
In-Reply-To: <20020730073009.N1441@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jul 30, 2002 07:30:09 am
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

> ah, you haven't been following the gcc mailing list.  due to a pressing
> need to change the c++ ABI, the current 3.1 development tree has been
> renamed to 3.2 and the erstwhile 3.2 development line has been renamed
> to 3.3.

3.1.1 has just been released.  3.2 will be released in the near future
and it will be identical to 3.1.1 except for the updates to the c++
ABI.  The 3.1 branch is now dead.  Regression fixing will continue
on the 3.2 branch after the first release.  The update to the 3.1
branch was made to accomodate the schedule of other projects (e.g.,
OpenOffice).  Since dwarf2 exception support isn't in 3.2, I doubt
this will affect hppa-linux much.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
