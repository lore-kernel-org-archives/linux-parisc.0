Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id B970648BC
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 12:06:33 -0700 (MST)
Date: Tue, 18 Mar 2003 11:02:20 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "b.gunreben" <b.gunreben@web.de>, jsoe0708@tiscali.be,
	willy@debian.org, doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Message-ID: <20030318190220.GT26139@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <3E7761F6.403DC5@web.de> <200303181853.h2IIr53R016234@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303181853.h2IIr53R016234@hiauly1.hia.nrc.ca>
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

> __canonicalize_funcptr_for_compare depends critically on the
> the initial setup of function descriptors by the dynamic loader
> and the trampoline in the dynamic loader used to resolve the
> address of functions.  This could easily break if someone
> unknowing messes with the pa specific parts of the dynamic
> loader or the setup of function descriptors.

um, Dave, we are talking about kernel here right? so no dynamic loader
is involved.

or did i misnuderstand you?
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
