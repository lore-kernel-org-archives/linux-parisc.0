Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id B39AD4847
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 06:26:43 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 9911ED98
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 14:26:38 +0200 (METDST)
Message-ID: <3DAC09D7.47F2D9C0@hpfrcu81.france.hp.com>
Date: Tue, 15 Oct 2002 14:28:07 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump driver: step by step
References: <3DABF865.8224BF5@admin.france.hp.com>
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
> If I believe the the
> "parisc 1.1 IO firmware Architecture".


The iodc.pdf document sez (page 3-29) 

ENTRY_INIT(index 3)
....
-9 Cannot locate a console device or boot device
   Returned only by options arg1=2 and arg1=3.


Dunno if it helps.

Phi
