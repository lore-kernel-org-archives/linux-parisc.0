Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crisis.wild-wind.fr.eu.org (lopsy-lu.misterjones.org [62.4.18.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id CEEEB482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Mar 2002 06:39:03 -0700 (MST)
To: "dan mclaughlin" <dmclaug881@hotmail.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] hp900 c110 scsi error
References: <OE27taTz8v6eoHvEmsg000144e8@hotmail.com>
Reply-To: mzyngier@freesurf.fr
From: Marc Zyngier <mzyngier@freesurf.fr>
Date: 27 Mar 2002 14:38:18 +0100
Message-ID: <wrp1ye6w2ph.fsf@hina.wild-wind.fr.eu.org>
In-Reply-To: <OE27taTz8v6eoHvEmsg000144e8@hotmail.com>
MIME-Version: 1.0
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

>>>>> "dan" == dan mclaughlin <dmclaug881@hotmail.com> writes:

dan> ncr53c720-0 Suspicious scsi data while ressetting the bus
dan> ncr53c720-0 dp1,dp15-8, dp0, d7-0,
dan> rst,req,ack,bsy,scl.atn,msg,c/d,i/o=0x1a2da9,expecting0x100

Looks like a SCSI terminator problem.

        M.
-- 
Places change, faces change. Life is so very strange.
