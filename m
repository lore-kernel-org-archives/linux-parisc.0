Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9969B4877
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jun 2003 23:47:35 -0600 (MDT)
Message-Id: <200306040547.h545lW9G016934@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiler & kernel
To: grundler@parisc-linux.org (Grant Grundler)
Date: Wed, 4 Jun 2003 01:47:31 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, joel.soete@tiscali.be, xam@cs.ucc.ie,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030603235913.GA3536@dsl2.external.hp.com> from "Grant Grundler" at Jun 3, 2003 05:59:13 pm
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

> On Tue, Jun 03, 2003 at 10:18:03AM -0400, John David Anglin wrote:
> > ...but the use of static binaries under 64-bit hpux is discouraged.
> 
> That depends on who you talk to.

Possibly, I was reading too much into what is stated in the pa64 runtime
supplement.  However, the default behavior of the HP 64-bit linker is to
link dynamically, even if no DLLs are found at link time.  It doesn't
really matter from a maintenance standpoint if a binary is dynamic or
static if it is solely linked with archive libraries.  I suspect that
one reason for this default is that internationalization support requires
linking with libdld.sl and using the dynamic loader.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
