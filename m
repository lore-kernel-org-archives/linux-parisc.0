Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server01 (s217-115-138-231.colo.hosteurope.de [217.115.138.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98BF64829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 06:20:34 -0600 (MDT)
From: "J.Steindlberger" <j@steindlberger.de>
To: Istvan Gyenes <frts@simba.sch.bme.hu>
Subject: Re: [parisc-linux] SMP kernel problems on a D350
Date: Thu, 19 Sep 2002 14:21:15 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.OSF.4.33.0209191111490.32375-100000@simba.sch.bme.hu>
In-Reply-To: <Pine.OSF.4.33.0209191111490.32375-100000@simba.sch.bme.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20020919122034.98BF64829@dsl2.external.hp.com>
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

Hi,

You can choose 32bit/64bit in the "Processor type" section. And only if You 
choose a processor that supports more than 32bit.

Did You try the config file included in the 2.4.18-smp kernel image package? 
Perhaps it's different in more than that SMP-section. So far for my ideas. If 
You still get problems, there is something to be fixed and the answering is 
up to an expert -- not me ;-) , sorry. I hope I could help You anyway.

Joerg
