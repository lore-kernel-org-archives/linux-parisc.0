Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F8604829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 07:00:17 -0600 (MDT)
Message-ID: <3D9AEE2C.823AE9BD@hpfrcu81.france.hp.com>
Date: Wed, 02 Oct 2002 15:01:32 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc and ++
References: <20021002034059.34434.qmail@web12505.mail.yahoo.com> <3D9A94D3.8010009@itp.bg> <3D9AA07A.4B994F44@hpfrcu81.france.hp.com> <20021002132411.Z18377@parcelfarce.linux.theplanet.co.uk>
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

Matthew Wilcox wrote:
> 
> 
> Undefined behaviour.  `|' is not a sequence point and you modify p more than
> once.  

Wouldn't be 'natural' to declare ++ a sequence point as well as comma is since
it has side effects, beside it would remove the sequence-point jazz in the
warning emits.

Right now the macro look like this for flawed/featured gcc.

#define get3_4(p) ({register uint32
t=(*p++)<<24;t+=(*p++)<<16,t+=(*p++)<<8,t+(*p++);})

Phi
