Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41A53482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 10:30:55 -0700 (MST)
Message-Id: <200211221730.gAMHUmfs005567@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc + SuSE (When email becomes to much)
To: jsoe0708@tiscali.be
Date: Fri, 22 Nov 2002 12:30:48 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DAAAD460000417C@ocpmta1.be.tiscali.com> from "jsoe0708@tiscali.be" at Nov 22, 2002 06:00:41 pm
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

> But I also thought to add "LD_LIBRARY_PATH=$DEST/hppa-linux/lib" where is
> located the new libc-2.3.1 and export but now the problem is into make:
> 
> make: /lib/ld.so.1: version 'GLIBC_PRIVATE' not found (required by /MyPath2/libc.so.6)

I seem to be using a non-dynamic version of make to avoid problems like
this.  I will leave it to others to comment on the compatibility of 2.3.1
with previous versions of glibc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
