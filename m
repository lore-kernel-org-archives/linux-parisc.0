Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFAA6482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 Jan 2002 08:45:36 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g08FjY7c003679
	for <parisc-linux@parisc-linux.org>; Tue, 8 Jan 2002 10:45:35 -0500 (EST)
Message-Id: <200201081545.g08FjX7A003677@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] FWD: gcc-3.0.3: ICE in reload_cse_simplify on hppa-linux
To: randolph@tausq.org
Date: Tue, 8 Jan 2002 10:45:33 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020108073218.GC16533@tausq.org> from "Randolph Chung" at Jan 7, 2002 11:32:18 pm
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

> > What version of bison are you using?  I suspect that 1.29 may have problems.
> > I am currently using 1.30.  I also think 1.28 is ok.  I saw one instance
> > of a problem similar to this with 1.29, although it wasn't on the PA.
> 
> i'm already using 1.30 unfortunately.

Then, I suggest trying with gcc-3.1 (prerelease).  It has quite a few
bug fixes that 3.0.3 doesn't have although it hasn't been tested much
on linux.  C and C++ definitely are in better shape.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
