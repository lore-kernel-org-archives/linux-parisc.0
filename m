Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE4C64874
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 07:59:58 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18nK5F-0004M2-00; Mon, 24 Feb 2003 14:59:57 +0000
Date: Mon, 24 Feb 2003 14:59:57 +0000
From: Matthew Wilcox <willy@debian.org>
To: law@redhat.com
Cc: Alan Modra <amodra@bigpond.net.au>,
	Matthew Wilcox <willy@debian.org>, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org
Message-ID: <20030224145957.K2938@parcelfarce.linux.theplanet.co.uk>
References: <20030224062421.GA31111@bubble.sa.bigpond.net.au> <200302241501.h1OF1WJT001142@localhost.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302241501.h1OF1WJT001142@localhost.redhat.com>; from law@redhat.com on Mon, Feb 24, 2003 at 08:01:31AM -0700
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
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

On Mon, Feb 24, 2003 at 08:01:31AM -0700, law@redhat.com wrote:
> And the GDB testsuite, which tests the PA disassembler.  I'm 99% sure
> it's going to fail after this change.

Is it OK if I fix the testsuite then?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
