Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 006DC4829
	for <parisc-linux@parisc-linux.org>; Wed,  6 Nov 2002 12:07:12 -0700 (MST)
Message-Id: <200211061846.gA6IkUuf026325@hiauly1.hia.nrc.ca>
To: jsoe0708@tiscali.be
Date: Wed, 6 Nov 2002 13:46:30 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <3DB5755500002283@ocpmta7.be.tiscali.com> from "jsoe0708@tiscali.be" at Nov 6, 2002 08:18:48 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: gcc-3.3 hppa patch
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

> init/main.c: In function `init':
> init/main.c:624: internal compiler error: Segmentation fault
> Please submit a full bug report,
> with preprocessed source if appropriate.

This may or may not be a gcc problem.  I can't easily recreate the
environment that caused the fault.  That's why GCC asks for preprocessed
source.

It also helps if you can narrow the problem down by eliminating
extraneous code to produce a simple testcase that causes the error.

> See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.

Please read and follow its recommendations.  Casual reports are not
good enough.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
