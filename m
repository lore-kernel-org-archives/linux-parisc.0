Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2C924862
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 06:28:23 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id 8BE1615C00D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 14:28:22 +0200 (CEST)
Date: Thu, 20 Jun 2002 14:28:22 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020620122822.GG27422@charite.de>
References: <03273D4BC7F4D511AC440008C7E6F881542343@nlntmail2b.ats.nld.alcatel.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <03273D4BC7F4D511AC440008C7E6F881542343@nlntmail2b.ats.nld.alcatel.nl>
Subject: [parisc-linux] Re: was: mail-man; should be hyper-mail
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

Am 20.06.2002 um 14:26:31 +0200 schrieb Witvliet, Hans folgendes:

> My college confused two things; it's a problem with hypermail version 2.1.4
> When starting with ./configure he gets: (manual copy)
> checking host system type ... hppa1.1-unknown-linux-gnu
> checking target system type.. hppa1.1-unknown-linux-gnu
> checking build system type... hppa1.1-unknown-linux-gnu
> ....
> .....
> creating config.h
> 
> next he types: make, and gets:
> building libtool
> checking host system type .... invalid configuragtion:
> ''parisc-unknown-linux-gnu': machine 'parisc-unknown' not recognized.
> ..
> make tables error 127
> pcre/libpcre.a error 2
> hypermail error 2

I see. The configure script doesn't "know" the system type
"hppa1.1-unknown-linux-gnu". Go get the Debian source package and use
that. In there, you can find the patches that were used to make the
thing compile correctly.

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
Busy installing a new clutch to better shift paradigms with. (ala Dilbert) --Michael Faurot mfaurot@phzzzt.atww.org
