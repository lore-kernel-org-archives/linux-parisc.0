Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-5-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84A2E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 08:36:29 -0600 (MDT)
Date: Thu, 30 May 2002 15:36:26 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Cc: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020530143626.GF810@tykepenguin.com>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com> <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020529180739.GL9919@tykepenguin.com>
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

Hmmm

CONFIG_KDB=y      : no serial console or FW SCSI
CONFIG_KDB=n      : all works fine.

bizarre!

patrick
