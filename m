Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83656482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Mar 2001 10:49:09 -0700 (MST)
To: rbradetich@uswest.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] PDC cleanup and encapsulation 
In-Reply-To: Your message of "Thu, 29 Mar 2001 01:18:30 MST."
             <20010329011830.A18639@beavis.ybsoft.com>
References: <20010329011830.A18639@beavis.ybsoft.com> 
Date: Thu, 29 Mar 2001 10:48:26 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14igX4-0004a3-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

I wonder if it makes sense to pass the lock to mem_pdc_call and let
it do the lock/unlock rather than doing that in every caller to
mem_pdc_call.

	-P
