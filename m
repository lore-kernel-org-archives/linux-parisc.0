From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcc-4.2-hppa64 bug
Date: Wed, 5 Dec 2007 14:15:56 -0500 (EST)
Message-ID: <200712051915.lB5JFv95003694@hiauly1.hia.nrc.ca>
References: <20071205170219.GA3608@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071205170219.GA3608@fattire.cabal.ca> from "Kyle McMartin" at Dec 5, 2007 12:02:19 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> It's pretty easily reproduceable by building a modular kernel with the
> ocfs2 module enabled. Is there anything I can do to help narrow this
> down?

The general process is to determine the compilation command that
fails.  "-da" can be used to determine the last function that's
being compiled.  Then, try to whittle down the testcase to something
that's easier to debug.  That's a good point to submit a GCC PR.

To actually debug the compilation, use "-v" to see the command gcc
uses to run cc1.  Run cc1 under gdb with the arguments shown with
"-v".  However, you probably won't get very far without a version
of cc1 with debug symbols.  It's also easiest to debug cc1 from
stage1 of the GCC bootstrap.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
