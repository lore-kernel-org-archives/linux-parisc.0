Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 989DA482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Feb 2002 07:17:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16YpMX-0005Ez-00; Thu, 07 Feb 2002 14:17:21 +0000
Date: Thu, 7 Feb 2002 14:17:21 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Kurc, Marcin A." <makurc@cooperstandard.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C240 64-bit kernel
Message-ID: <20020207141721.B17779@parcelfarce.linux.theplanet.co.uk>
References: <426B4FEBE684D411B0A60090273B1D24024855EB@aa0016.auburn.auto.cooperintra.ctb>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <426B4FEBE684D411B0A60090273B1D24024855EB@aa0016.auburn.auto.cooperintra.ctb>; from makurc@cooperstandard.com on Thu, Feb 07, 2002 at 07:23:31AM -0500
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

On Thu, Feb 07, 2002 at 07:23:31AM -0500, Kurc, Marcin A. wrote:
> Hi,
> Did anybody got a C240 to boot off of 64-bit kernel?

you need to turn on CONFIG_PDC_NARROW if you do this.  But don't bother,
there is no point in booting a 64-bit kernel on a C240.

-- 
Revolutions do not require corporate support.
