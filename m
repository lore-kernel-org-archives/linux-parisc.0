Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp02.web.de [217.72.192.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id E58714829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 15:50:03 -0700 (MST)
Message-ID: <3E1B598D.3D31F412@web.de>
Date: Tue, 07 Jan 2003 23:49:49 +0100
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem with weak symbols
References: <200301072049.h07KnF1F023893@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=iso-8859-1
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

John David Anglin wrote:
> =

> > I have a problem with weak symbols on parisc. If I use the following
> > small program, the result should be always (nil), but it isn=B4t:
> =

> I believe the enclosed binutils patch will fix the problem.  I will
> install it after a little more testing.

Thanks, I will try this. If someone knows who is maintaining the XFree86
package of debian, this is the reason why imake does not detect the glibc=

correctly. I tried to debug it myself, but at this point I was stuck. =


This was a fast bugfix:) Thank you

Berthold
