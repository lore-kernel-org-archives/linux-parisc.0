Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id D355C485C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 06:59:50 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 0A70F10F2
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 14:59:45 +0200 (METDST)
Message-ID: <3DAC119C.9A5EE02E@hpfrcu81.france.hp.com>
Date: Tue, 15 Oct 2002 15:01:16 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump driver: step by step
References: <3DABF865.8224BF5@admin.france.hp.com> <3DAC09D7.47F2D9C0@hpfrcu81.france.hp.com> <3DAC0D9E.BD896745@admin.france.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Bruno Vidal wrote:
> 
> Please take a look to my email -> I'm using arg1=4 or 5
> not 2 or 3.
> So how do you explain this -9 for "init & test mod & dev"
> 


I red :-) You mentioned 'parisc 1.1 IO firmware Architecture' which is kind of
generic title, then thought you missed the iodc.pdf doc.

> So how do you explain this -9 for "init & test mod & dev"

May be you used arg1 to 2 or 3 when you really wanted 4 or 5 

OR

-9 is also returned for 4 or 5 meaning  meaning
 1: machdep.h:283   #define IODCE_NOSUCHDEV  -9

as returned by scan from ./ISU/mongoose/machdep.h

Cheers,
Phi
