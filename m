Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9147482A
	for <parisc-linux@parisc-linux.org>; Fri, 31 May 2002 11:15:07 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g4VHF5FN006502
	for <parisc-linux@parisc-linux.org>; Fri, 31 May 2002 13:15:06 -0400 (EDT)
Message-Id: <200205311715.g4VHF4Pu006500@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
To: joel.soete@freebel.net
Date: Fri, 31 May 2002 13:15:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <1022858049.3cf793414fbf4@webmail.tiscalinet.be> from "joel.soete@freebel.net" at May 31, 2002 05:14:09 pm
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

> It seems to be well comited in last cvs update this morming I got in
> src/gcc/gcc/fixinc/inclhack.def:
> ...
> /*
>  * __thread is now a keyword.
>  */

> But do not seems to be applied as I got the same error?
> 
> What do I wrong or forget to do?

You should see the following in your build output:

Applying thread_keyword           to pthread.h
Fixed:  pthread.h

A fixed pthread.h should appear in the {build}/gcc/include directory.
This seems to work ok for me in a native hppa-linux build.  However,
it appears that you are trying to do a cross build.  If the header
is not being fixed, you will need to examine your build log carefully
to determine why the fix isn't being done or doesn't work.

Dave
--
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
