Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.be (alc250.alcatel.be [195.207.101.250])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0A924856
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 06:26:59 -0600 (MDT)
Message-ID: <03273D4BC7F4D511AC440008C7E6F881542343@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'Ralf Hildebrandt'" <Ralf.Hildebrandt@charite.de>,
	"Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
Date: Thu, 20 Jun 2002 14:26:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] was: mail-man; should be hyper-mail
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

Sorry,

My college confused two things; it's a problem with hypermail version 2.1.4
When starting with ./configure he gets: (manual copy)
checking host system type ... hppa1.1-unknown-linux-gnu
checking target system type.. hppa1.1-unknown-linux-gnu
checking build system type... hppa1.1-unknown-linux-gnu
....
.....
creating config.h

next he types: make, and gets:
building libtool
checking host system type .... invalid configuragtion:
''parisc-unknown-linux-gnu': machine 'parisc-unknown' not recognized.
..
make tables error 127
pcre/libpcre.a error 2
hypermail error 2


Hans

	-----Original Message-----
	From:	Ralf Hildebrandt [SMTP:Ralf.Hildebrandt@charite.de]
	Sent:	Thursday, June 20, 2002 11:52 AM
	To:	Witvliet, Hans
	Cc:	parisc-linux@lists.parisc-linux.org
	Subject:	Re: [parisc-linux] mail-man

	On Thu, Jun 20, 2002 at 10:50:50AM +0200, Witvliet, Hans wrote:
	> Hi,
	> 
	> Short question,
	> 
	> Did anybody already succeed in compiling mailman?
	> Here (712/100) it failed.

	What failed and how?

	-- 
	Ralf Hildebrandt (Im Auftrag des Referat V A)
Ralf.Hildebrandt@charite.de
	Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450
570-155
	Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450
570-916
	Why you can't find your system administrators:
	Finished a double shift and is out back wondering what that big
burning ball in the sky is. 
