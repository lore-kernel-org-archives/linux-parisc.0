Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 113A54844
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 08:13:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16T2cB-0005HI-00; Tue, 22 Jan 2002 15:13:35 +0000
Date: Tue, 22 Jan 2002 15:13:35 +0000
From: Matthew Wilcox <willy@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash.
Message-ID: <20020122151335.X31512@parcelfarce.linux.theplanet.co.uk>
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com> <3C4D2EFB.F82671C2@admin.france.hp.com> <20020122105553.A5510@electra.intern.planb.de> <3C4D5A46.426BE5E5@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C4D5A46.426BE5E5@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Tue, Jan 22, 2002 at 01:25:42PM +0100
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

On Tue, Jan 22, 2002 at 01:25:42PM +0100, Bruno Vidal wrote:
> 	Hi
> I think that Enrik has a good starting point, where can I find
> a good how-to about libbfd ? there is nothing under /usr/share/doc ?
> A web page ?

apt-get install binutils-doc
info bfd

-- 
Revolutions do not require corporate support.
