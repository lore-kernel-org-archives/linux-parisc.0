Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id A080F4872
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Nov 2002 03:40:33 -0700 (MST)
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com [172.21.143.36])
	by mgw-x4.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id gARAfE600454
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Nov 2002 12:41:14 +0200 (EET)
Received: from esebh003.NOE.Nokia.com (unverified) by esvir04nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5ed1ebb835ac158f24077@esvir04nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Wed, 27 Nov 2002 12:40:12 +0200
Received: from aurinko.ntc.nokia.com (aurinko.ntc.nokia.com [172.22.105.49]) by trinms01.ntc.nokia.com with ESMTP (8.7.5/8.7.3) id MAA11264 for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Nov 2002 12:40:09 +0200 (EET)
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id gARAe9j06516
	for parisc-linux@lists.parisc-linux.org; Wed, 27 Nov 2002 12:40:09 +0200 (EET)
Date: Wed, 27 Nov 2002 12:40:08 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dual Video Cards?
Message-ID: <20021127104008.GB11322@aurinko.ntc.nokia.com>
References: <200211251751.gAPHpHDf017394@hiauly1.hia.nrc.ca> <20021126040920.32100.qmail@web12508.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20021126040920.32100.qmail@web12508.mail.yahoo.com>
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

On Mon, Nov 25, 2002 at 08:09:20PM -0800, ext Derek Engelhaupt wrote:

> Anyone running dual displays on a C Class?  And if so how?  I 
> understand it needs two video cards or one card with dual output.  
> Thanks.....

Well, I have both a VIS-EG/PCI and a VIS-EG/GSC in a C360, but it's 
running HP-UX and not Linux. 

Hardware-wise it isn't a problem, even though the GSC card isn't 
officially supported in a C360. You might want to check the boot 
consols config though, diagnosing display problems with that during boot 
isn't fun without a serial console. And if you want to have a graphics 
console, do mind the slot designations ... I wouldn't try to make the GSC 
card the console in the C360, for example.

Don't know how you'd go about configuring those in Linux though. In HP-UX 
it's rather simple but that doesn't help much...


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
