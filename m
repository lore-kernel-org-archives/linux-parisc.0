Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BBF8482A
	for <parisc-linux@parisc-linux.org>; Tue,  1 Jan 2002 11:35:02 -0700 (MST)
Message-Id: <200201011834.g01IYqPf012263@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] HOWTO - PARISC Linux XC (v1.0 Dec 31 2001)
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Tue, 1 Jan 2002 13:34:52 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, marteaut@esiee.fr,
	grundler@puffin.external.hp.com
In-Reply-To: <20011231164231.C4130@systemhalted> from "Carlos O'Donell Jr." at Dec 31, 2001 04:42:31 pm
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

> Cross-Compiler HOWTO at:
> 
> http://www.baldric.uwo.ca/HOWTO/PARISC-Linux-XC-HOWTO.html

Check the document title.

Regarding the "layout", you might specifically mention that the build tree
should not be in the source tree.  This causes problems if you try to build
the ada compiler in 3.1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
