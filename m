From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Fri, 29 Jan 2010 11:45:06 -0500 (EST)
Message-ID: <20100129164507.5DA9D4E77@hiauly1.hia.nrc.ca>
References: <119aab441001290808g51a80822m91ff468cc07fa0ed@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001290808g51a80822m91ff468cc07fa0ed@mail.gmail.com> from "Carlos O'Donell" at Jan 29, 2010 11:08:16 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This is technically a generic glibc bug.
> 
> Does linking with `-u pthread_create` fix the testcase? It fixes the
> failure on x86.

Yes, the segv doesn't happen and the program executes correctly.  However,
it's broken with gcc head when static linking isn't used.  Still trying to
determine which gcc revision caused the regression.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
