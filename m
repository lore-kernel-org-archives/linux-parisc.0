Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3981C4845
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 06:24:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3ab0-0006JO-A2; Sun, 28 Sep 2003 13:24:14 +0100
Date: Sun, 28 Sep 2003 13:24:14 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@steeleye.com>,
	Matthew Wilcox <willy@debian.org>
Message-ID: <20030928122414.GF24824@parcelfarce.linux.theplanet.co.uk>
References: <3F76A312.8090603@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F76A312.8090603@tiscali.be>
Subject: [parisc-linux] Re: zalon/ncr53c720 (linux-2.6.0-test5-pa22) broken on C110
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

On Sun, Sep 28, 2003 at 09:00:02AM +0000, Joel Soete wrote:
> I am sure there is no hw pb because after that test I can always reboot 
> with 2.6.0-test5-PA6:

This is good to hear.

> Can somebody could help me to find patches (step by step) applied on 
> this driver from -pa6 to -pa22?

Yes.  Could you start with -pa18 (or -pa20)?
http://cvs.parisc-linux.org/download/linux-2.6/patch-2.6.0-test5-pa18.gz
(or cvs up -rCVS260_TEST5_PA18)

The driver is rev 1.5 in -test5-pa6.  rev 1.6 is in -test5-pa18.
After -test5-pa20, we don't have anyautotagged stuff, but let's start
with -pa18.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
