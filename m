Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 800AF4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 01:56:29 -0700 (MST)
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com [172.21.143.36])
	by mgw-x4.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h0F8wat25239
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 10:58:36 +0200 (EET)
Received: from esebh001.NOE.Nokia.com (unverified) by esvir04nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5fcde44881ac158f24078@esvir04nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Wed, 15 Jan 2003 10:56:23 +0200
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id h0F8uLt24126
	for parisc-linux@lists.parisc-linux.org; Wed, 15 Jan 2003 10:56:21 +0200 (EET)
Date: Wed, 15 Jan 2003 10:56:20 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030115085619.GA17760@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Interesting network card ...
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

What's the deal with the various HP-branded tulip-based NICs? Are they 
expected to "just work" or what? I found one that sure doesn't, but then 
again, but my kernel isn't actually new ... (2.4.18-32 packaged)

The card is the HP ANA-6911A/AUI (yes, it's a 10/100BT with coax and 
AUI too), part# A3738-60001, and it _is_ found by the tulip driver, but 
for some reason the driver claims that "no MII transceiver found", and 
does list the 10B2 and AUI connections too. But I can't seem to make it 
form a link with TP or coax, no matter what I do. And the AUI connector 
is blocked by the C240 chassis. Is there a simple way to force the use of 
a certain transceiver? Tried mii-tool already and it didn't help much - 
but then again it doesn't seem to know about the coax and AUI at all...

Then again, I haven't tested this card on HP-UX either yet so it could be 
a hardware problem...


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
