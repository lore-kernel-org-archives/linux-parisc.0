Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 200FC482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 13:25:49 -0600 (MDT)
Message-Id: <200308111925.h7BJPljx020074@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: grundler@parisc-linux.org (Grant Grundler)
Date: Mon, 11 Aug 2003 15:25:47 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030811190914.GA25311@dsl2.external.hp.com> from "Grant Grundler" at Aug 11, 2003 01:09:14 pm
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

> What's interesting is the "ld" command has "-lgcc-eh" which is where
> the missing symbols are defined:
> grundler <512>nm libgcc_eh.a | grep _Unwind_SjLj_Resume
> 0000079c T _Unwind_SjLj_Resume
> 000008d0 T _Unwind_SjLj_Resume_or_Rethrow
> grundler <513>pwd
> /usr/lib/gcc-lib/hppa-linux/3.3.1

Yes, but libgcc_eh.a doesn't contain the versioned symbols that the shared
libraries need.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
