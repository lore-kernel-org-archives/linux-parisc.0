Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3E89482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 16:56:45 -0600 (MDT)
Message-Id: <200105042256.SAA26474@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
To: matthew@wil.cx (Matthew Wilcox)
Date: Fri, 4 May 2001 18:56:41 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: matthew@wil.cx, parisc-linux@parisc-linux.org
In-Reply-To: <20010504233655.K32445@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at May 4, 2001 11:36:55 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> which is the middle of nowhere.  Actually, it's right _after_ __longjmp.
> clearly it should be returning to 4100ea4c

In __longjmp.S, try changing `ldw     80(%r26), %rp' to `ldw     80(%r26), %r2'.Same in setjmp.S.  Possibly, rp is not defined.  This cause the above.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
