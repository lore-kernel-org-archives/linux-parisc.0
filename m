Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3583482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Aug 2003 05:37:43 -0600 (MDT)
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com [172.21.143.36])
	by mgw-x4.nokia.com (Switch-2.2.6/Switch-2.2.6) with ESMTP id h75BbgJ00512
	for <parisc-linux@lists.parisc-linux.org>; Tue, 5 Aug 2003 14:37:42 +0300 (EET DST)
Received: from esebh002.NOE.Nokia.com (unverified) by esvir04nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T63def37e7fac158f24077@esvir04nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Tue, 5 Aug 2003 14:37:41 +0300
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id h75Bber20581
	for parisc-linux@lists.parisc-linux.org; Tue, 5 Aug 2003 14:37:40 +0300 (EEST)
Date: Tue, 5 Aug 2003 14:37:40 +0300
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030805113739.GT14491@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Terminfo/termcap for a 70096 ...
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

I tried to ask this question in the comp.sys.hp.hpux newsgroup once but 
didn't get any useful answers... anyone here know better?

(yes, I know, this is probably specifically _not_ a problem on 
parisc-linux as all the parisc stuff is supposed to have a HP-UX license 
in the first place, for some version of HP-UX.)

Is it legal to copy terminfo and termcap entries (from HP-UX in this 
case)?

The problem is that HP-UX is pretty much the only thing that comes with a 
terminfo entry for a 70096, and we have a bunch of those that could be 
useful on other systems too ... except that the scrollback doesn't work 
in the emulation modes. 

It would therefore be better to be able to run in native mode, but this 
pretty much _requires_ the terminfo/termcap entry ... 

Oh, and about the cursor keys on the 70096, if I were to put them in the 
"application" mode, would that help with bash et al.? They seem to be 
working in swinstall and such on HP-UX ... but the default mode seems to 
be non-transmitting, right? (yes, I could use that too myself, and 
re-enter stuff from the buffer with the print/enter key and do the 
line-modify thing... but the others have a hard time learning that.)


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
