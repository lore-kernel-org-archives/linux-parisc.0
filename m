Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D64DD482C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 17:01:31 -0700 (MST)
Message-Id: <200111062357.QAA08384@puffin.external.hp.com>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B2000 :-) 
In-Reply-To: Message from Richard Allen <ra@hp.is>
   of "Tue, 06 Nov 2001 16:15:08 GMT." <20011106161508.C1639@hp.is>
Date: Tue, 06 Nov 2001 16:57:29 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Richard Allen wrote:
> The kernel snapshot from late October crashed on this machine.
> Now all runs smooth :-)   (with serial console and no IDE connected)

Very good...we've been running on c3k/j5k for quite some time
via serial console. JSM serial under suckyio and VM working earlier
this year.  USB and IDE are also part of suckyio and neither works
right now...Randolph Chung is hacking on USB and I've been hacking
on IDE but due to goofiness (and bugs) in suckyio, it's just not
working yet...

J5600 and similar boxes HPMC. Workaround in elroy code is available but
I just haven't have time to debug that. If someone in HP gave me a
couple of B2600's, I'd be alot more interested in working on this.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
