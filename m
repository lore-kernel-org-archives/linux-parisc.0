Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 152734839
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Feb 2002 11:13:40 -0700 (MST)
Message-Id: <200202281813.g1SIDaSL009893@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compiling source packages
To: smithjames@comcast.net
Date: Thu, 28 Feb 2002 13:13:36 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <000d01c1c081$db6db9c0$02c1a8c0@james.co.uk> from "James S" at Feb 28, 2002 01:00:50 pm
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

> checking host system type... Invalid configuration
> 'parisc-unknown-linux-gnu': machine 'parisc-unknown' not recognized

Some source packages have old versions of the file config.guess which
can cause this type of problem.  When you configure, use "--host=hppa-linux".
More package recognize this.  If this doesn't work, you can replace
config.guess with a newer version (e.g., from gcc) and hope this works.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
