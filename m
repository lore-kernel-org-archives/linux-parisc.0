Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07CE3482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Nov 2001 15:30:01 -0700 (MST)
To: Timothy Ball <timball@tux.org>
Cc: parics Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] make palo error? 
In-Reply-To: Your message of "Tue, 20 Nov 2001 16:42:51 EST."
             <20011120214251.GA5953@gwyn.tux.org>
References: <20011120214251.GA5953@gwyn.tux.org> 
Date: Tue, 20 Nov 2001 15:30:00 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E166JOy-0002yT-00@noam.fc.hp.com>
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

= I do a make palo and I get an error, but the lifimage file is in
= ../palo/lifimage. Should I be worried about this?

Yes, worry.  do a 'make realclean' first -- at least make sure
that iplboot is nuked

	-P
