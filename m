Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 4B0B5488D; Mon, 13 Oct 2003 13:44:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A98cE-00069K-R4; Mon, 13 Oct 2003 20:44:26 +0100
Date: Mon, 13 Oct 2003 20:44:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	soete.joel@tiscali.be, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] flush_tlb_all_local:
Message-ID: <20031013194426.GS27861@parcelfarce.linux.theplanet.co.uk>
References: <20031013041448.GD2467@colo.lackof.org> <200310131857.h9DIvKqS029380@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310131857.h9DIvKqS029380@hiauly1.hia.nrc.ca>
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

On Mon, Oct 13, 2003 at 02:57:19PM -0400, John David Anglin wrote:
> Probably, there should be a comment in the code noting this special
> behavior.

Done.  They're deliberately a little bit cryptic to ensure that people
actually go and look at the arch book, but they are different so people
don't think this might be a merge error.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
