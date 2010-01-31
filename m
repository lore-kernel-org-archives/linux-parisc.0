From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segmentation fault in __libc_start_main with -static
Date: Sun, 31 Jan 2010 11:39:05 -0500 (EST)
Message-ID: <20100131163906.58A5C4EA9@hiauly1.hia.nrc.ca>
References: <119aab441001290808g51a80822m91ff468cc07fa0ed@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441001290808g51a80822m91ff468cc07fa0ed@mail.gmail.com> from "Carlos O'Donell" at Jan 29, 2010 11:08:16 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Carlos,

Could you look at GCC target/42850?  This is for the same testcase.

It looks like glibc either has a hidden dependence on libgcc_s, or
we have a dynamic loader bug.  See comment #3.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
