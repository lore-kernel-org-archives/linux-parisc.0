Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5100487C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Nov 2002 10:36:36 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18HSaV-0007ft-00; Thu, 28 Nov 2002 17:36:31 +0000
Date: Thu, 28 Nov 2002 17:36:31 +0000
From: Matthew Wilcox <willy@debian.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] flush_data_cache
Message-ID: <20021128173631.N1586@parcelfarce.linux.theplanet.co.uk>
References: <CB813811CBF6D3118DCC00902740BB4A0BA20C5F@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <CB813811CBF6D3118DCC00902740BB4A0BA20C5F@xsp01.brazil.hp.com>; from leandro.farinati@hp.com on Thu, Nov 28, 2002 at 12:05:14PM -0500
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

On Thu, Nov 28, 2002 at 12:05:14PM -0500, FARINATI,LEANDRO (HP-Brazil,ex1) wrote:
> I am trying to use this function declared in cache.h (I put this include in
> my source code) and I was obtain a linker error (undefined reference to
> `flush_data_cache_local').
> I am verify that the function flush_data_cache é um define to
> flush_data_cache_local, but I am do not identify the reason of the error.

umm.. is this a module or linked into the kernel?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
