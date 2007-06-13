From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Wed, 13 Jun 2007 09:32:24 -0400 (EDT)
Message-ID: <200706131332.l5DDWObn025750__45432.7023741373$1416624392$gmane$org@hiauly1.hia.nrc.ca>
References: <20070613082133.GA19999@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: seb@frankengul.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070613082133.GA19999@frankengul.org> from "seb@frankengul.org"
	at Jun 13, 2007 10:21:33 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I could remove this patch altogether. But I still wonder why this patch works
> ok on other archs and not on hppa*.

hppa* does a deferred generation of plabels for indirect function calls.
I think this is affected by the change.  I don't recall exactly but there
may have been a followup patch to fix this.  Of course, this change isn't
in the 4.1 GCC tree.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
