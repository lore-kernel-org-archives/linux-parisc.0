Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.cs.brandeis.edu (hermes.cs.brandeis.edu [129.64.2.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43920492D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Nov 2001 09:12:19 -0700 (MST)
Received: from [129.64.46.46] ([129.64.46.83])
	by hermes.cs.brandeis.edu (8.11.6/8.9.3) with ESMTP id fAIGC4k28485
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Nov 2001 11:12:04 -0500
Mime-Version: 1.0
Message-Id: <a05100316b81d8d1c41f3@[129.64.46.46]>
Date: Sun, 18 Nov 2001 11:11:01 -0500
To: parisc-linux@lists.parisc-linux.org
From: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: [parisc-linux] 755/125 problems
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

So I finally have a viable system in the form of a 755/125(384mb ram, 
internal FWscsi drive and 2 atm cards).  I can get it to boot under 
the HPUX still installed on the HD, and it seems to work(not root 
pw).  I tried booting it off the internal CD with the 0.92 disc and 
it seemed to freeze at the 'Branching to kernel address .....".
Three questions:
Is this common or an oddity with my system?
It currently only allows a net boot off of the ATM cards, either the 
EISA or the slider.  How can I force it to use the onboard 10 base 
T(AUI) or even 10 Base 2?
The other might be slightly off topic, but is there an easy way to 
reset the root pw on the HPUX install?(I believe I have HPUX install 
media somewhere but I'm probably wrong.)
Aaron
-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
